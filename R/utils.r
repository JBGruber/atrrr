the <- new.env()


inside_pkg <- function() {
  d <- basename(getwd()) == "atrrr"
  p <- 0
  if (d) p <- any(grepl("Package: atrrr", readLines("DESCRIPTION")))
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
      hostname = dirname(hostname),
      path = basename(hostname),
      query = as.list(all_params)
    ) |>
      structure(class = "httr2_url") |>
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

  parts <- uri |>
    stringr::str_split("\\/+")

  tibble::tibble(
    protocol   = purrr::map_chr(parts, 1, .default = NA_character_),
    repo       = purrr::map_chr(parts, 2, .default = NA_character_),
    collection = purrr::map_chr(parts, 3, .default = NA_character_),
    rkey       = purrr::map_chr(parts, 4, .default = NA_character_)
  )

}

parse_http_url <- function(url){

  parts <- purrr::map(url, function(u) try(httr2::url_parse(u), silent = TRUE) |>
                        purrr::pluck("path") |>
                        stringr::str_split("(?<=.)\\/"))

  if (isTRUE(stringr::str_detect(url, "starter-pack"))) {
    out <- tibble::tibble(
      collection  = purrr::map_chr(parts, c(1, 1), .default = NA_character_),
      repo       = purrr::map_chr(parts, c(1, 2), .default = NA_character_),
      rkey       = purrr::map_chr(parts, c(1, 3), .default = NA_character_)
    )
  } else {
    out <- tibble::tibble(
      repo_type  = purrr::map_chr(parts, c(1, 1), .default = NA_character_),
      repo       = purrr::map_chr(parts, c(1, 2), .default = NA_character_),
      collection = purrr::map_chr(parts, c(1, 3), .default = NA_character_),
      rkey       = purrr::map_chr(parts, c(1, 4), .default = NA_character_)
    )
  }

  map <- c(
    "post" = "app.bsky.feed.post",
    "feed" = "app.bsky.feed.generator",
    "lists" = "app.bsky.graph.list",
    "/starter-pack" = "app.bsky.graph.starterpack"
  )
  out$collection <- unname(map[out$collection])

  return(out)
}


#' Resolve the did behind a handle
#' @noRd
resolve_handle <- function(.handle, .token = NULL){
  do.call(
    com_atproto_identity_resolve_handle,
    list(handle = .handle, .token = .token)
  )[["did"]]
}

is_did <- function(str) {
  isTRUE(stringr::str_detect(str, "^did\\:"))
}

is_at <- function(str) {
  isTRUE(stringr::str_detect(str, "^at\\:"))
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
  verbose <- verbose %||%
    getOption("ATR_VERBOSE") %||%
    Sys.getenv("ATR_VERBOSE", unset = TRUE)
  as.logical(verbose)
}


#' lexicon seems wrong. translated from https://atproto.com/blog/create-post#images-embeds
#' @noRd
com_atproto_repo_upload_blob2 <- function(file,
                                          .token = NULL) {
  if (identical(file, "")) return()
  .token <- .token %||% get_token()
  req <- httr2::request("https://bsky.social/xrpc/com.atproto.repo.uploadBlob") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt)

  if (stringr::str_detect(file, "^http|^www")) {
    res <- httr2::request(file) |>
      httr2::req_perform()

    # fix blob too larger error https://github.com/JBGruber/atrrr/issues/27
    if (length(res$body) > 1000000 & grepl("image", res$headers$`content-type`)) {
      rlang::check_installed("magick")
      res$body <- magick::image_read(res$body) |>
        magick::image_write(defines = c("jpeg:extent" = "1000kb"))
    }

    req |>
      httr2::req_headers("Content-Type" = res$headers$`content-type`) |>
      httr2::req_body_raw(body = res$body) |>
      httr2::req_perform() |>
      httr2::resp_body_json()
  } else if (file.exists(file)) {
    rlang::check_installed("mime")
    if (file.info(file)$size > 1000000 & grepl("image", mime::guess_type(file))) {
      rlang::check_installed("magick")
      cli::cli_alert_info(
        "Image {file} is too large and will be compressed before uploading"
      )
      file <- magick::image_read(file) |>
        magick::image_write(path = tempfile(fileext = ".jpeg"),
                            defines = c("jpeg:extent" = "1000kb"))
    }
    req |>
      httr2::req_headers("Content-Type" = mime::guess_type(file)) |>
      httr2::req_body_file(path = file) |>
      httr2::req_perform() |>
      httr2::resp_body_json()
  } else {
    cli::cli_abort("image/video file {file} could not be found locally or online.")
  }

}


did_lookup <- function(did) {
  # cheers hrbrmstr!
  httr2::request("https://plc.directory/") |>
    httr2::req_url_path_append(did) |>
    httr2::req_error(is_error = function(resp) FALSE) |>
    httr2::req_perform() |>
    httr2::resp_body_json(check_type = FALSE) |>
    purrr::pluck("alsoKnownAs", 1, .default = did)
}


#' matches the behavior of Python's re.find with multi-byte characters
#' @noRd
str_locate_all_bytes <- function(string, pattern) {

  # calculate byte length of each character
  character  <-  strsplit(string, split = "")[[1]]
  byte_len <- tibble::tibble(
    character,
    b_len = purrr::map_int(character, function(str) length(charToRaw(str)))
  )

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


fetch_preview <- function(record) {
  facets <- purrr::pluck(record, "facets")
  uri <- purrr::map_chr(facets, function(f)
    purrr::pluck(f, "features", 1, "uri", .default = NA_character_)) |>
    stats::na.omit() |>
    utils::head(1L) # only one link can be previewed

  if (length(uri) > 0L) {
    # this is the API bsky.app is using. Not sure how robust it is
    resp <- httr2::request("https://cardyb.bsky.app/v1/extract") |>
      httr2::req_url_query(url = uri) |>
      httr2::req_error(is_error = function(resp) FALSE) |>
      httr2::req_perform()

    if (httr2::resp_status(resp) < 400L) {
      preview <- resp |>
        httr2::resp_body_json()
      embed <- list(`$type` = "app.bsky.embed.external",
                    external = list(uri = preview$url,
                                    title = preview$title,
                                    description = preview$description))
      if (purrr::pluck_exists(preview, "image")) {
        embed$external$thumb <-
          com_atproto_repo_upload_blob2(purrr::pluck(preview, "image"))$blob
      }
    } else {
      embed <- list(`$type` = "app.bsky.embed.external",
                    external = list(uri = uri,
                                    title = "",
                                    description = ""))
    }
    record$embed <- embed
  }
  return(record)
}

# extract features, e.g., hashtags, links and mentions from an unparsed post
extrct_ftrs <- function(post, feature_type) {
  facets <- purrr::pluck(post, "record", "facets")
  purrr::map(facets, function(fct) {
    if (purrr::pluck(fct, "features", 1, "$type") == feature_type) {
      purrr::pluck(fct, "features", 1, "tag")
    }
  }) |>
    unlist()
}

# save ggplot plots in file to post them
from_ggplot <- function(image) {
  if (methods::is(image, "ggplot")) {
    rlang::check_installed("ggplot2")
    tmp <- tempfile(fileext = ".png")
    ggplot2::ggsave(tmp, image,
                    width = 7,
                    height = 7)
    image <- tmp
  }
  return(image)
}

as_tibble_onerow <- function(l) {
  l <- purrr::map(l, function(c) {
    if (length(c) != 1) {
      return(list(c))
    }
    return(c)
  })
  # .name_repair required for older versions of Ollama
  tibble::as_tibble(l, .name_repair = snakecase::to_snake_case)
}

as_iso_date <- function(x) {
  as.POSIXct(x, tz = "UTC") |>
    format("%Y-%m-%dT%H:%M:%OS3Z", tz = "UTC")
}
