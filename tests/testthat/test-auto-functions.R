test_env <- new.env()

mock_test <- function(req) {
  # req <<- req

  # Check if auth was sent
  if (req$headers$Authorization != "Bearer test") test_env$fail <- "no auth"

  endpoint <- stringr::str_remove(basename(req$url), "\\?.*")
  rlang::check_installed("jsonlite")
  lex <- system.file(paste0("lexicons/", gsub(".", "/", endpoint, fixed = TRUE), ".json"), package = "atrrr") |>
    jsonlite::read_json()

  # Check correct request method
  lexicon_type <- purrr::pluck(lex, "defs", "main", "type", .default = "")

  lexicon_method <- switch(lex$defs$main$type,
                           procedure = "POST",
                           "GET")

  if (req$method != lexicon_method) test_env$fail <- "wrong method"

  # Check paramters
  params <- stringr::str_extract(basename(req$url), "(?<=\\?).*") |>
    strsplit("&") |>
    purrr::pluck(1)

  if (!(all(is.null(params)) || all(is.na(params)))) {

    params_names <- stringr::str_extract(params, ".*(?==)")
    params <- stringr::str_extract(params, "(?<==).*")

    if (!all(params_names %in% names(lex$defs$main$parameters$properties))) test_env$fail <- "wrong parameters"

    for (p in unique(params_names)) {
      v <- params[p == params_names]
      t <- ifelse(is.numeric(v), "int", "string")
      t <- ifelse(length(v) > 1, "array", t)

      if (t != lex$defs$main$parameters$properties[[p]]$type) test_env$fail <- "wrong parameter type"
    }

  }

  # TODO: check body parameters
  req$body

  return(httr2::response(status_code = 200))
}


# some manual tests to see if the approach works
test_that("test", {
  expect_error({
    test_env$fail <- NULL
    httr2::with_mocked_responses(mock_test, {
      app_bsky_actor_get_profile(actor = c("test1", "test2"), .token = list(accessJwt = "test"), .return = c("json", "resp"))
    })
    if (!is.null(test_env$fail)) stop(fail)
  })
  expect_no_error({
    test_env$fail <- NULL
    httr2::with_mocked_responses(mock_test, {
      x <- app_bsky_actor_get_profile(actor = "test", .token = list(accessJwt = "test"), .return = c("json", "resp"))
    })
    if (!is.null(test_env$fail)) stop(fail)
  })
  expect_no_error({
    test_env$fail <- NULL
    httr2::with_mocked_responses(mock_test, {
      app_bsky_actor_get_profiles(actor = c("test1", "test2"), .token = list(accessJwt = "test"), .return = c("json", "resp"))
    })
    if (!is.null(test_env$fail)) stop(fail)
  })
})


prep_args <- function(fun) {
  args <- formals(fun)
  args <- lapply(args, function(a) {
    if (is.symbol(a)) return("test")
    a
  })
  if (".token" %in% names(args)) args[[".token"]] <- list(accessJwt = "test")
  return(args)
}

library(atrrr) # ls only works for attached packages
auto_functions <- ls(getNamespace("atrrr"), pattern = "^com_|app_") |>
  setdiff("com_atproto_repo_upload_blob2")
#auto_functions <- ls("package:atrrr", pattern = "app_bsky_actor_get_prof")


lapply(auto_functions, function(f) {
  test_that(f, {
    test_env <- new.env()
    expect_no_error({
      test_env$fail <- NULL
      httr2::with_mocked_responses(mock_test, {
        do.call(what = eval(f), args = prep_args(eval(f)))
      })
      if (!is.null(test_env$fail)) stop(fail)
    })
  })
})
