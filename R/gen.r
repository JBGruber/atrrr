build_function <- function(lexicon,
                           method = "GET",
                           gpt_documentation = TRUE,
                           out_file = "R/auto_generated.r") {

  if (is.character(lexicon)) {
    lexicon <- read_lexicon(lexicon)
  }

  endpoint <- lexicon$id

  params <- purrr::pluck(lexicon, "defs", "main", "parameters", "properties",
                         .default = NULL)

  params <- c(params, list(token = NULL))

  required <- lexicon$defs$main$parameters[["required"]]

  fun_name <- f_name(endpoint)

  param_names <- names(params)
  param_declaration <- paste0(
    param_names,
    ifelse(param_names %in% unlist(required), "", " = NULL"),
    collapse = ", "
  )

  description <- lexicon$defs$main$description
  # TODO: parametrize the parameters name and description
  # TODO: parametrize the output of the function
  # TODO: parametrize example

  new_fun <- readLines(system.file("function.template", package = "atr")) |>
    purrr::map_chr(glue::glue)

  new_fun <- askgpt::chat_api(prompt = glue::glue(
    "Document this R function using roxygen2 syntax.",
    "Only return the code, no other comments and no new syntax:",
    "\n{new_fun}"
  ),
  model = "gpt-4") |>
    askgpt::parse_response()

  funs <- readLines("R/auto_generated.r")

  # TODO: check if function exists and already has roxygen documentation
  writeLines(c(funs, "\n\n", new_fun), out_file)

}
