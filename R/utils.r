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


flatten_query_params <- function(arg_calls){

  arg_calls |>
    purrr::imap(~{
      .x <- eval(.x)
      names(.x) <- rep(.y, length(.x))
      .x
    }) |>
    unname() |>
    unlist()
}

make_request <- function(hostname, params, req_method = c("GET", "POST")){

  params <<- params

  .token = params[[".token"]]
  .return = params[[".return"]]
  params[[".token"]] <- NULL
  params[[".return"]] <- NULL

  if(req_method == "GET"){
    all_params <<- all_params <- flatten_query_params(params)

    resp <- list(
      scheme = "https",
      hostname = hostname,
      query = as.list(all_params)
    ) |>
      httr2::url_build() |>
      httr2::request() |>
      httr2::req_method('GET') |>
      httr2::req_auth_bearer_token(token = .token$accessJwt) |>
      httr2::req_perform()

  } else if(req_method == "POST"){

    resp <- httr2::request(glue::glue("https://{hostname}")) |>
      httr2::req_method("POST") |>
      httr2::req_auth_bearer_token(token = .token$accessJwt) |>
      httr2::req_body_json(params) |>
      httr2::req_perform()

  }


  switch(
    .return,
    resp = resp,
    json = resp |>
      httr2::resp_body_json()
  )
}
