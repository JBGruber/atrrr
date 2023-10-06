#' Find actors (profiles) matching search criteria.
#'
#' @param query The search query. Searches in user names and descriptions.
#' @param limit Maximum number of records to return. For queries with more than
#'   100 results, pagination is used automatically (one request per 100
#'   results).
#' @param cursor Cursor for pagination (to pick up an old search).
#' @param parse Parse the results or return the original nested object sent by
#'   the server.
#' @param .token If you manage your own tokens, you can supply it here. Usually
#'   \code{NULL} is OK and will automatically load or guide you to generate a
#'   token.
#'
#' @export
#' @returns a data frame (or nested list) of found actors.
#' @examples
#' \dontrun{
#' search_actor("BenGuinaudea")
#' search_actor("Blog: favstats.eu")
#' search_actor("github.com/JBGruber ")
#' search_actor("@UvA_ASCoR")
#' }
#'
search_actor <- function(query,
                         limit = 25L,
                         cursor = NULL,
                         parse = TRUE,
                         .token = NULL) {
  res <- list()
  req_limit <- ifelse(limit > 100, 100, limit)
  last_cursor <- NULL

  cli::cli_progress_bar(
    format = "{cli::pb_spin} Got {length(res)} records, but there is more.. [{cli::pb_elapsed}]",
    format_done = "Got {length(res)} records. All done! [{cli::pb_elapsed}]"
  )

  while (length(res) < limit) {
    resp <- app_bsky_actor_search_actors(
      q = query,
      limit = NULL,
      cursor = last_cursor,
      .token = NULL,
      .return = "json"
    )

    last_cursor <- resp$cursor
    res <- c(res, resp$actors)

    if (is.null(resp$cursor)) break
    cli::cli_progress_update(force = TRUE)
  }

  cli::cli_progress_done()

  if (parse) {
    out <- parse_response(res)
  } else {
    out <- res
  }
  attr(out, "last_cursor") <- last_cursor
  return(out)
}

