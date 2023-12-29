the <- new.env()


inside_pkg <- function() {
  d <- basename(getwd()) == "atr"
  p <- 0
  if (d) p <- any(grepl("Package: atr", readLines("DESCRIPTION")))
  d + p == 2L
}


error_parse <- function(resp) {
  e <- httr2::resp_body_json(resp)
  c(
    glue::glue("error type: {e$error}"),
    glue::glue("message: {e$message}")
  )
}


f_name <- function(id) {
  # id <- sub("app.bsky.", "", id, fixed = TRUE)
  id <- gsub(".", "_", id, fixed = TRUE)
  tolower(gsub("([A-Z])", "_\\1", id))
}


flatten_query_params <- function(arg_calls) {
  arg_calls |>
    purrr::compact() |>
    purrr::imap(~ {
      .x <- eval(.x)
      names(.x) <- rep(.y, length(.x))
      .x
    }) |>
    unname() |>
    unlist()
}


make_request <- function(hostname, params, req_method = c("GET", "POST")) {
  req_method <- match.arg(req_method)

  .token <- params[[".token"]] %||% get_token()
  params[[".token"]] <- NULL
  if (methods::is(.token, "character") && file.exists(.token)) {
    .token <- read_token(.token)
  }

  .return <- utils::head(params[[".return"]], 1L) %||% ""
  params[[".return"]] <- NULL

  if (req_method == "GET") { #

    all_params <- flatten_query_params(params)

    resp <- list(
      scheme = "https",
      hostname = hostname,
      query = as.list(all_params)
    ) |>
      httr2::url_build() |>
      httr2::request() |>
      httr2::req_method("GET") |>
      httr2::req_auth_bearer_token(token = .token$accessJwt) |>
      httr2::req_error(body = error_parse) |>
      httr2::req_perform()
  } else if (req_method == "POST") {
    resp <- httr2::request(glue::glue("https://{hostname}")) |>
      httr2::req_method("POST") |>
      httr2::req_auth_bearer_token(token = .token$accessJwt) |>
      httr2::req_body_json(params) |>
      httr2::req_error(body = error_parse) |>
      httr2::req_perform()
  }

  if(.return %in% c("", "json")){
    if(length(resp$body)){
      resp <- httr2::resp_body_json(resp)
    } else {
      resp <- list()
    }
  }

  return(resp)
}

parse_at_uri <- function(uri){

  uri |>
    stringr::str_split("\\/+") |>
    purrr::map_dfr(~{
      .x |>
        purrr::set_names(c("protocol", "repo", "collection", "rkey")) |>
        as.list() |>
        tibble::as_tibble()
    })

}

parse_http_url <- function(url){

  url |>
    purrr::map_dfr(~{
      url_parts <- httr2::url_parse(.x)

      url_parts$path |>
        stringr::str_split("(?<=.)\\/") |>
        purrr::pluck(1) |>
        purrr::set_names(c("repo_type", "repo", "collection", "rkey")) |>
        as.list() |>
        tibble::as_tibble() |>
        dplyr::mutate(
          collection = switch(
            collection,
            "post" = "app.bsky.feed.post",
            "feed" = "app.bsky.feed.generator",
            "lists" = "app.bsky.graph.list",
            collection
          )
        )
    })

}


#' simple default parser
#' @noRd
parse_response <- function(x) {
  purrr::map(x, function(r) {
    purrr::list_flatten(r) |>
      tibble::as_tibble() |>
      janitor::clean_names()
  }) |>
    dplyr::bind_rows()
}


#' feed parser
#' @noRd
parse_feed <- function(x) {
  purrr::map(x, function(r) {
    tibble::tibble(
      uri = r$post$uri,
      cid = r$post$cid,
      author = list(r$post$author),
      text = r$post$record$text,
      record = list(r$post$record),
      reply_count = r$post$replyCount,
      repost_count = r$post$repostCount,
      like_count = r$post$likeCount,
      indexed_at = parse_time(r$post$indexedAt),
      reply = list(r$reply)
    )
  }) |>
    dplyr::bind_rows()
}


#' standard date parser for the format used by the protocol
#' @noRd
parse_time <- function(x) {
  strptime(x, format = "%Y-%m-%dT%H:%M:%OSZ", tz = "UTC")
}

#' Resolve the did behind a handle
#' @noRd
resolve_handle <- function(.handle, .token = NULL){
  do.call(
    com_atproto_identity_resolve_handle,
    list(handle = .handle, .token = .token)
  )[["did"]]
}

is_did <- function(str){
  stringr::str_detect(str, "^did\\:")
}

#' Convert an http url to an at uri
#' @noRd
convert_http_to_at <- function(http_url,
                               .token = NULL) {

  http_info <- parse_http_url(http_url)

  if(!is_did(http_info$repo)){
    http_info$repo <- resolve_handle(http_info$repo, .token = .token)
  }

  glue::glue("at://{repo}/{collection}/{rkey}", .envir = http_info)
}

#' Convert an an at uri to http url
#' @noRd
convert_at_to_http <- function(uri) {

  at_info <- parse_at_uri(uri)

  glue::glue("https://bsky.app/profile/{at_info$repo}/post/{at_info$rkey}",
             .envir = http_info)
}


get_thread_root <- function(thread) {
  parent <- NULL
  parent_1_up <- purrr::pluck(thread$thread, "parent")
  while (!is.null(parent_1_up)) {
    parent <- parent_1_up
    parent_1_up <- purrr::pluck(parent, "parent")
  }
  if (is.null(parent)) parent <- thread$thread
  return(parent)
}


#' Check verbosity
#' @noRd
verbosity <- function(verbose) {
  verbose %||%
    as.logical(getOption("ATR_VERBOSE")) %||%
    as.logical(Sys.getenv("ATR_VERBOSE", unset = TRUE))
}


#' lexicon seems wrong. translated from https://atproto.com/blog/create-post#images-embeds
#' @noRd
com_atproto_repo_upload_blob2 <- function(image,
                                          .token = NULL) {

  .token <- .token %||% get_token()
  rlang::check_installed("magick")
  img <- magick::image_read(image)
  image_mimetype <- paste0("image/", tolower(magick::image_info(img)$format))

  # TODO: not sure how to get the magick image as raw vector
  img <- readBin(image, "raw", file.info(image)$size)

  httr2::request("https://bsky.social/xrpc/com.atproto.repo.uploadBlob") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_headers("Content-Type" = image_mimetype) |>
    httr2::req_body_raw(img) |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}


#' matches the behavior of Python's re.find with multi-byte characters
#' @noRd
str_locate_all_bytes <- function(string, pattern) {

  # calculate byte length of each character
  byte_len <- tibble::tibble(character = strsplit(string, split = "")[[1]]) |>
    dplyr::mutate(b_len = stringi::stri_numbytes(character))

  # match the pattern
  spans <- stringr::str_locate_all(string, pattern)[[1]] |>
    tibble::as_tibble() |>
    tibble::add_column(match = "")

  if (nrow(spans) > 0) {
    # add matched text before shifting locations
    for (i in seq_along(spans$start)) {
      spans$match[i] <- substr(string, spans$start[i] + 1, spans$end[i])
    }
    # shift locations using byte lengths
    for (i in seq_along(spans$start)) {
      spans$start[i] <- sum(byte_len$b_len[1:spans$start[i]])
      spans$end[i] = sum(byte_len$b_len[1:spans$end[i]])
    }
  }
  return(spans)
}
