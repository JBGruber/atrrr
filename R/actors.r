#' Find users (profiles) matching search criteria.
#'
#' @param query The search query. Searches in user names and descriptions or
#'   \strong{exact} matches in user handles (including the \emph{.bsky.social}
#'   part).
#' @param limit Maximum number of records to return. For queries with more than
#'   100 results, pagination is used automatically (one request per 100
#'   results). The function stops when the limit is reached, but you will
#'   usually get a few items more than requested.
#' @param cursor Cursor for pagination (to pick up an old search).
#' @param parse Parse the results or return the original nested object sent by
#'   the server.
#' @param verbose Whether to print status messages to the Console
#'   (\code{TRUE}/\code{FALSE}). Package default (when \code{NULL}) is to have
#'   status messages. Can be changed with \code{Sys.setenv(ATR_VERBOSE =
#'   FALSE)}.
#' @param .token If you manage your own tokens, you can supply it here. Usually
#'   \code{NULL} is OK and will automatically load or guide you to generate a
#'   token.
#'
#' @export
#' @returns a data frame (or nested list) of found actors.
#' @examples
#' \dontrun{
#' search_user("benguinaudeau.bsky.social")
#' search_user("Blog: favstats.eu")
#' search_user("JBGruber")
#' search_user("@UvA_ASCoR")
#' search_user("rstats", limit = 1000L)
#' }
search_user <- function(query,
                        limit = 25L,
                        cursor = NULL,
                        parse = TRUE,
                        verbose = NULL,
                        .token = NULL) {

  res <- list()
  req_limit <- ifelse(limit > 100, 100, limit)
  last_cursor <- NULL

  if (verbosity(verbose)) cli::cli_progress_bar(
    format = "{cli::pb_spin} Got {length(res)} records, but there is more.. [{cli::pb_elapsed}]",
    format_done = "Got {length(res)} records. All done! [{cli::pb_elapsed}]"
  )

  while (length(res) < limit) {
    resp <- do.call(
      what = app_bsky_actor_search_actors,
      args = list(
        q = query,
        limit = req_limit,
        cursor = last_cursor,
        .token = .token,
        .return = "json"
      ))

    last_cursor <- resp$cursor
    res <- c(res, resp$actors)

    if (is.null(resp$cursor)) break
    if (verbosity(verbose)) cli::cli_progress_update(force = TRUE)
  }

  if (verbosity(verbose)) cli::cli_progress_done()

  if (parse) {
    if (verbosity(verbose)) cli::cli_progress_step("Parsing {length(res)} results.")
    out <- parse_response(res)
    if (verbosity(verbose)) cli::cli_process_done(msg_done = "Got {nrow(out)} results. All done!")
  } else {
    out <- res
  }
  attr(out, "last_cursor") <- last_cursor
  return(out)
}


#' Query profile of an actor
#'
#' @param actor user handle(s) to get information for.
#' @inheritParams search_user
#'
#' @returns a data frame (or nested list) of found actors.
#' @export
#'
#' @examples
#' \dontrun{
#' rstats_user <- search_user("rstats", limit = 2L)
#' get_user_info(rstats_user$handle)
#' }
get_user_info <- function(actor,
                          parse = TRUE,
                          .token = NULL) {

  res <- do.call(
    what = app_bsky_actor_get_profiles,
    args = list(
      actor,
      .token = .token,
      .return = "json"
    )) |>
    purrr::pluck("profiles")

  if (parse) {
    res <- parse_actors(res)
  }
  return(res)
}
