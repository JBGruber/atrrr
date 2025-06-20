#' app_bsky_unspecced_get_config
#' Get miscellaneous runtime configuration.
#' @noRd
app_bsky_unspecced_get_config <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.unspecced.getConfig",
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
    name = "bsky.social/xrpc/app.bsky.unspecced.getPopularFeedGenerators",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_unspecced_get_suggested_feeds
#' Get a list of suggested feeds
#' @noRd
app_bsky_unspecced_get_suggested_feeds <- function(limit = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.unspecced.getSuggestedFeeds",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_unspecced_get_suggested_feeds_skeleton
#' Get a skeleton of suggested feeds. Intended to be called and hydrated by app.bsky.unspecced.getSuggestedFeeds
#' @noRd
app_bsky_unspecced_get_suggested_feeds_skeleton <- function(viewer = NULL, limit = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.unspecced.getSuggestedFeedsSkeleton",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_unspecced_get_suggested_starter_packs
#' Get a list of suggested starterpacks
#' @noRd
app_bsky_unspecced_get_suggested_starter_packs <- function(limit = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.unspecced.getSuggestedStarterPacks",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_unspecced_get_suggested_starter_packs_skeleton
#' Get a skeleton of suggested starterpacks. Intended to be called and hydrated by app.bsky.unspecced.getSuggestedStarterpacks
#' @noRd
app_bsky_unspecced_get_suggested_starter_packs_skeleton <- function(viewer = NULL, limit = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.unspecced.getSuggestedStarterPacksSkeleton",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_unspecced_get_suggested_users
#' Get a list of suggested users
#' @noRd
app_bsky_unspecced_get_suggested_users <- function(category = NULL, limit = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.unspecced.getSuggestedUsers",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_unspecced_get_suggested_users_skeleton
#' Get a skeleton of suggested users. Intended to be called and hydrated by app.bsky.unspecced.getSuggestedUsers
#' @noRd
app_bsky_unspecced_get_suggested_users_skeleton <- function(viewer = NULL, category = NULL, limit = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.unspecced.getSuggestedUsersSkeleton",
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
    name = "bsky.social/xrpc/app.bsky.unspecced.getSuggestionsSkeleton",
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
    name = "bsky.social/xrpc/app.bsky.unspecced.getTaggedSuggestions",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_unspecced_get_trending_topics
#' Get a list of trending topics
#' @noRd
app_bsky_unspecced_get_trending_topics <- function(viewer = NULL, limit = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.unspecced.getTrendingTopics",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_unspecced_get_trends
#' Get the current trends on the network
#' @noRd
app_bsky_unspecced_get_trends <- function(limit = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.unspecced.getTrends",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_unspecced_get_trends_skeleton
#' Get the skeleton of trends on the network. Intended to be called and then hydrated through app.bsky.unspecced.getTrends
#' @noRd
app_bsky_unspecced_get_trends_skeleton <- function(viewer = NULL, limit = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.unspecced.getTrendsSkeleton",
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
    name = "bsky.social/xrpc/app.bsky.unspecced.searchActorsSkeleton",
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
    name = "bsky.social/xrpc/app.bsky.unspecced.searchPostsSkeleton",
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
    name = "bsky.social/xrpc/app.bsky.unspecced.searchStarterPacksSkeleton",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}
