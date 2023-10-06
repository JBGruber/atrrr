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

  # TODO: remove
  params <<- params

  .token <- params[[".token"]] %||% get_token()
  params[[".token"]] <- NULL

  .return <- head(params[[".return"]], 1L) %||% ""
  params[[".return"]] <- NULL

  if (req_method == "GET") { #

    # TODO: remove
    all_params <<- all_params <- flatten_query_params(params)

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
    map_dfr(~{
      url_parts <- httr2::url_parse(.x)

      url_parts$path |>
        stringr::str_split("(?<=.)\\/") %>%
        .[[1]] |>
        purrr::set_names(c("repo_type", "repo", "collection", "rkey")) |>
        as.list() |>
        tibble::as_tibble() |>
        mutate(
          collection = switch(
            collection,
            "post" = "app.bsky.feed.post"
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
