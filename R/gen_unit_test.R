get_params <- function(fun_name, .token) {
  fun <- get(fun_name, envir = asNamespace("atr"))
  args <- formalArgs(fun)

  params <- list()
  if ("actor" %in% args) {
    params[["actor"]] <- c("tv$ownhandle", "tv$handle1", "tv$handle2")
  }
  if ("actors" %in% args) {
    params[["actors"]] <- c(" c(tv$handle1, tv$handle2)")
  }
  if ("limit" %in% args) {
    params[["limit"]] <- c("NULL", "1", "2")
  }
  if ("uri" %in% args) {
    params[["uri"]] <- c("tv$feed_gen1", "tv$feed_gen2", "tv$list1", "tv$post_uri")
  }
  if ("uris" %in% args) {
    params[["uris"]] <- c("tv$aoc_posts")
  }
  if ("algorithm" %in% args) {
    # params[["uris"]] <- c("aoc_posts")
  }
  if ("feed" %in% args) {
    params[["feed"]] <- c("tv$feed1")
  }
  if ("feeds" %in% args) {
    params[["feeds"]] <- c("c(tv$feed1, tv$feed2)")
  }
  if ("depth" %in% args) {
    params[["depth"]] <- c("NULL", "0", "3", "5", "10")
  }
  if ("parentHeight" %in% args) {
    params[["parentHeight"]] <- c("NULL", "0", "80", "160")
  }
  if ("filter" %in% args) {
    params[["filter"]] <- c("NULL", "tv$posts_with_replies", "tv$posts_no_replies", "tv$posts_with_media")
  }
  if ("cursor" %in% args) {
    params[["cursor"]] <- c(T, F)
  }

  param_grid <- expand_grid(!!!params) |>
    mutate(index = row_number())

  param_grid |>
    split(1:nrow(.)) |>
    map_chr(~ {
      index <- .x$index

      .x[["index"]] <- NULL
      .x[["cursor"]] <- NULL

      arg_declaration <- .x |>
        discard(~ .x == "NULL") |>
        purrr::imap_chr(~ paste(.y, .x, sep = " = ")) |>
        paste(collapse = ", ")

      glue::glue("{fun_name}({arg_declaration}, .token = .token, .return = 'resp') # {index}")
    }) |>
    unname()
}
