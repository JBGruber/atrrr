#' Get followers and follows of an actor
#'
#' @param actor user handle to look up followers for.
#' @inheritParams search_user
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
                          verbose = NULL,
                          .token = NULL) {

  res <- list()
  req_limit <- ifelse(limit > 100, 100, limit)
  last_cursor <- NULL

  if (verbosity(verbose)) cli::cli_progress_bar(
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


#' @rdname get_followers
#' @export
get_follows <- function(actor,
                        limit = 25L,
                        cursor = NULL,
                        parse = TRUE,
                        verbose = NULL,
                        .token = NULL) {

  res <- list()
  req_limit <- ifelse(limit > 100, 100, limit)
  last_cursor <- NULL

  if (verbosity(verbose)) cli::cli_progress_bar(
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


#' Un/Follow an account
#'
#' @param actor User handle to follow or unfollow
#' @inheritParams search_user
#'
#' @details You can only unfollow accounts which you also followed through the
#' API/the package.
#'
#'
#' @return list with URI and CID of the record (invisible).
#' @export
#'
#' @examples
#' \dontrun{
#' # follow our test account
#' follow("atpr.bsky.social")
#'
#' # unfollow our test account
#' unfollow("atpr.bsky.social")
#' }
follow <- function(actor,
                   verbose = NULL,
                   .token = NULL) {

  if (verbosity(verbose)) cli::cli_progress_step(
    msg = "Request to follow {actor}",
    msg_done = "You now follow {actor}",
    msg_failed = "Something went wrong"
  )
  actor_did <- resolve_handle(actor, .token = .token)

  repo <- get_token()[["handle"]]
  collection <- "app.bsky.graph.follow"
  record <- list(
    "subject" = actor_did,
    "createdAt" = format(as.POSIXct(Sys.time(), tz = "UTC"), "%Y-%m-%dT%H:%M:%OS6Z")
  )

  invisible(
    do.call(
      what = com_atproto_repo_create_record,
      args = list(repo, collection, record, .token = .token)
    )
  )
}


#' @rdname follow
#' @export
unfollow <- function(actor,
                     verbose = NULL,
                     .token = NULL) {

  if (verbosity(verbose)) cli::cli_progress_step(
    msg = "Request to unfollow {actor}",
    msg_done = "You are no longer following {actor}",
    msg_failed = "Something went wrong"
  )

  repo <- get_token()[["handle"]]
  collection <- "app.bsky.graph.follow"

  # list follow records
  resp <- do.call(
    what = com_atproto_repo_list_records,
    args = list(repo,
         collection,
         limit = 100,
         .token = .token)
  )

  # resolve actor did
  actor_did <- resolve_handle(actor, .token = .token)

  # filter and parse records
  record <- resp$records |>
    purrr::keep(function(.x) .x$value$subject == actor_did)
  follow_info <- parse_at_uri(record[[1]]$uri)

  invisible(
    do.call(
      what = com_atproto_repo_delete_record,
      args = list(
        repo = follow_info$repo,
        collection = follow_info$collection,
        rkey = follow_info$rkey,
        .token = .token
      )
    )
  )
}

