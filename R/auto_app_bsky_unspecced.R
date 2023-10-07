#' app_bsky_unspecced_get_popular
#' DEPRECATED: will be removed soon, please find a feed generator alternative
#' @noRd
app_bsky_unspecced_get_popular <- function(includeNsfw = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.unspecced.getPopular",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_unspecced_get_popular_feed_generators
#' An unspecced view of globally popular feed generators
#' @noRd
app_bsky_unspecced_get_popular_feed_generators <- function(limit = NULL, cursor = NULL, query = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.unspecced.getPopularFeedGenerators",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_unspecced_get_timeline_skeleton
#' A skeleton of a timeline - UNSPECCED & WILL GO AWAY SOON
#' @noRd
app_bsky_unspecced_get_timeline_skeleton <- function(limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.unspecced.getTimelineSkeleton",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_unspecced_search_actors_skeleton
#' Backend Actors (profile) search, returning only skeleton
#' @noRd
app_bsky_unspecced_search_actors_skeleton <- function(q, typeahead = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.unspecced.searchActorsSkeleton",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_unspecced_search_posts_skeleton
#' Backend Posts search, returning only skeleton
#' @noRd
app_bsky_unspecced_search_posts_skeleton <- function(q, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.unspecced.searchPostsSkeleton",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}
