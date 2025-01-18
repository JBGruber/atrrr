#' Get Starter Pack
#'
#' Get all info about a starter pack and the users on it.
#'
#' @param starter_pack the URL of a starter pack
#' @inheritParams search_user
#'
#' @returns a data frame of users and list info
#' @export
#'
#' @examples
#' \dontrun{
#' get_starter_pack("https://bsky.app/starter-pack/sof14g1l.bsky.social/3lbc4bqetfp22")
#' }
get_starter_pack <- function(starter_pack,
                             parse = TRUE,
                             .token = NULL) {

  starter_pack_uri <- convert_http_to_at(starter_pack, .token = .token)
  res <- do.call(app_bsky_graph_get_starter_pack, list(starter_pack_uri, .token = .token))
  if (!parse) return(res)
  return(parse_starter_packs(res))
}


#' Get List
#'
#' Get a feed of recent posts from a list (posts and reposts from any actors on
#' the list).
#'
#' @param list The url of the requested list
#' @inheritParams get_feed
#'
#' @returns a data frame (or nested list) of posts
#' @export
#'
#' @examples
#' \dontrun{
#' # use the URL of a list to get users on the list
#' get_list("https://bsky.app/profile/smachlis.bsky.social/lists/3l7o5d7b7nl2q")
#'
#' # or the feed of that list
#' get_list_feed("https://bsky.app/profile/smachlis.bsky.social/lists/3l7o5d7b7nl2q")
#' }
get_list <- function(list,
                     limit = 25,
                     cursor = NULL,
                     parse = TRUE,
                     verbose = NULL,
                     .token = NULL) {

  res <- list()
  req_limit <- ifelse(limit > 100, 100, limit)
  last_cursor <- NULL

  if (verbosity(verbose)) cli::cli_progress_bar(
    format = "{cli::pb_spin} Got {length(res)} users, but there is more.. [{cli::pb_elapsed}]",
    format_done = "Got {length(res)} records. All done! [{cli::pb_elapsed}]"
  )

  list_url <- convert_http_to_at(list, .token = .token)

  while (length(res) < limit) {
    resp <- do.call(
      what = app_bsky_graph_get_list,
      args = list(
        list = list_url,
        limit = req_limit,
        cursor = last_cursor,
        .token = .token,
        .return = "json"
      ))

    last_cursor <- resp$cursor
    res <- c(res, resp$items)

    if (is.null(resp$cursor)) break
    if (verbosity(verbose)) cli::cli_progress_update(force = TRUE)
  }

  if (verbosity(verbose)) cli::cli_progress_done()

  if (parse) {
    if (verbosity(verbose)) cli::cli_progress_step("Parsing {length(res)} results.")
    out <- parse_list(res, resp)
    if (verbosity(verbose)) cli::cli_process_done(msg_done = "Got {nrow(out)} results. All done!")
  } else {
    resp$items <- res
    out <- resp
  }
  attr(out, "last_cursor") <- last_cursor
  return(out)
}


#' @rdname get_list
get_list_feed <- function(list,
                          limit = 25,
                          cursor = NULL,
                          parse = TRUE,
                          verbose = NULL,
                          .token = NULL) {

  res <- list()
  req_limit <- ifelse(limit > 100, 100, limit)
  last_cursor <- NULL

  if (verbosity(verbose)) cli::cli_progress_bar(
    format = "{cli::pb_spin} Got {length(res)} skeets, but there is more.. [{cli::pb_elapsed}]",
    format_done = "Got {length(res)} records. All done! [{cli::pb_elapsed}]"
  )

  feed_url <- convert_http_to_at(list, .token = .token)

  while (length(res) < limit) {
    resp <- do.call(
      what = app_bsky_feed_get_list_feed,
      args = list(
        list = feed_url,
        limit = req_limit,
        cursor = last_cursor,
        .token = .token,
        .return = "json"
      ))

    last_cursor <- resp$cursor
    res <- c(res, resp$feed)

    if (is.null(resp$cursor)) break
    if (verbosity(verbose)) cli::cli_progress_update(force = TRUE)
  }

  if (verbosity(verbose)) cli::cli_progress_done()

  if (parse) {
    if (verbosity(verbose)) cli::cli_progress_step("Parsing {length(res)} results.")
    out <- parse_feed(res)
    if (verbosity(verbose)) cli::cli_process_done(msg_done = "Got {nrow(out)} results. All done!")
  } else {
    out <- res
  }
  attr(out, "last_cursor") <- last_cursor
  return(out)
}
