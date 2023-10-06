#' Get followers and follows of an actor
#'
#' @param actor user handle to look up followers for.
#' @inheritParams search_actor
#'
#' @export
#' @returns a data frame (or nested list) of found actors.
#'
#' @examples
#' \dontrun{
#' get_followers("benguinaudeau.bsky.social")
#' get_follows("favstats.bsky.social")
#' }
get_followers <- function(actor,
                          limit = 25L,
                          cursor = NULL,
                          parse = TRUE,
                          .token = NULL) {

  res <- list()
  req_limit <- ifelse(limit > 100, 100, limit)
  last_cursor <- NULL

  cli::cli_progress_bar(
    format = "{cli::pb_spin} Got {length(res)} followers, but there is more.. [{cli::pb_elapsed}]",
    format_done = "Got {length(res)} records. All done! [{cli::pb_elapsed}]"
  )

  while (length(res) < limit) {
    resp <- do.call(
      what = app_bsky_graph_get_followers,
      args = list(
        actor = actor,
        limit = req_limit,
        cursor = last_cursor,
        .token = NULL,
        .return = "json"
      ))

    last_cursor <- resp$cursor
    res <- c(res, resp$followers)

    if (is.null(resp$cursor)) break
    cli::cli_progress_update(force = TRUE)
  }

  cli::cli_progress_done()

  if (parse) {
    cli::cli_progress_step("Parsing {length(res)} results.",
                           msg_done = "All done!")
    out <- parse_response(res)
  } else {
    out <- res
  }
  attr(out, "last_cursor") <- last_cursor
  return(out)
}


#' @rdname get_followers
get_follows <- function(actor,
                          limit = 25L,
                          cursor = NULL,
                          parse = TRUE,
                          .token = NULL) {

  res <- list()
  req_limit <- ifelse(limit > 100, 100, limit)
  last_cursor <- NULL

  cli::cli_progress_bar(
    format = "{cli::pb_spin} Got {length(res)} follows, but there is more.. [{cli::pb_elapsed}]",
    format_done = "Got {length(res)} records. All done! [{cli::pb_elapsed}]"
  )

  while (length(res) < limit) {
    resp <- do.call(
      what = app_bsky_graph_get_follows,
      args = list(
        actor = actor,
        limit = req_limit,
        cursor = last_cursor,
        .token = NULL,
        .return = "json"
      ))

    last_cursor <- resp$cursor
    res <- c(res, resp$follows)

    if (is.null(resp$cursor)) break
    cli::cli_progress_update(force = TRUE)
  }

  cli::cli_progress_done()

  if (parse) {
    cli::cli_progress_step("Parsing {length(res)} results.",
                           msg_done = "All done!")
    out <- parse_response(res)
  } else {
    out <- res
  }
  attr(out, "last_cursor") <- last_cursor
  return(out)
}

