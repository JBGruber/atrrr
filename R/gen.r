build_function <- function(lexicon,
                           gpt_documentation = FALSE,
                           out_file = "R/auto_generated.r") {
  if (is.character(lexicon)) {
    lexicon <- read_lexicon(lexicon)
  }

  endpoint <- lexicon$id
  fun_name <- f_name(endpoint)

  lexicon_main <- purrr::pluck(lexicon, "defs", "main", .default = NULL)
  lexicon_type <- purrr::pluck(lexicon_main, "type", .default = NULL) %||% ""
  lexicon_description <- purrr::pluck(lexicon_main, "description", .default = NULL) %||% ""



  if (lexicon_type == "query") {
    req_method <- "GET"
    lexicon_params <- purrr::pluck(lexicon_main, "parameters", .default = NULL)
  } else if (lexicon_type == "procedure") {
    req_method <- "POST"
    lexicon_params <- purrr::pluck(lexicon_main, "input", "schema", .default = NULL)
  } else {
    warning(glue::glue("Endpoint {endpoint} neither procedure nor query"))
    return(NULL)
  }

  params <- purrr::pluck(lexicon_params, "properties", .default = NULL)
  required <- purrr::pluck(lexicon_params, "required", .default = NULL)

  # TODO: I'm not sure we can do this this way, because we're exposing the token in the url
  params <- c(params, list(.token = NULL))

  param_names <- names(params)[order(!names(params) %in% unlist(required))]

  param_declaration <- paste0(
    param_names,
    ifelse(param_names %in% unlist(required), "", " = NULL"),
    collapse = ", "
  )

  ## Get query
  # TODO: Add query rate especially to test the package
  cur_env <- rlang::current_env()

  new_fun <- readLines(system.file("function.template", package = "atrrr")) |>
    purrr::map_chr(glue::glue, .envir = cur_env)

  funs <- ""
  if (file.exists(out_file)) {
    funs <- readLines(out_file)
  }

  # TODO: check if function exists and already has roxygen documentation
  writeLines(c(funs, "\n\n", new_fun), out_file)
}
