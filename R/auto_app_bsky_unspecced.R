#' app_bsky_unspecced_get_config
#' Get miscellaneous runtime configuration.
#' @noRd
app_bsky_unspecced_get_config <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.unspecced.getConfig",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_unspecced_get_popular_feed_generators
#' An unspecced view of globally popular feed generators.
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



#' app_bsky_unspecced_get_suggestions_skeleton
#' Get a skeleton of suggested actors. Intended to be called and then hydrated through app.bsky.actor.getSuggestions
#' @noRd
app_bsky_unspecced_get_suggestions_skeleton <- function(viewer = NULL, limit = NULL, cursor = NULL, relativeToDid = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.unspecced.getSuggestionsSkeleton",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_unspecced_get_tagged_suggestions
#' Get a list of suggestions (feeds and users) tagged with categories
#' @noRd
app_bsky_unspecced_get_tagged_suggestions <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.unspecced.getTaggedSuggestions",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_unspecced_search_actors_skeleton
#' Backend Actors (profile) search, returns only skeleton.
#' @noRd
app_bsky_unspecced_search_actors_skeleton <- function(q, viewer = NULL, typeahead = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
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
#' Backend Posts search, returns only skeleton
#' @noRd
app_bsky_unspecced_search_posts_skeleton <- function(q, sort = NULL, since = NULL, until = NULL, mentions = NULL, author = NULL, lang = NULL, domain = NULL, url = NULL, tag = NULL, viewer = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.unspecced.searchPostsSkeleton",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_unspecced_search_starter_packs_skeleton
#' Backend Starter Pack search, returns only skeleton.
#' @noRd
app_bsky_unspecced_search_starter_packs_skeleton <- function(q, viewer = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.unspecced.searchStarterPacksSkeleton",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}
