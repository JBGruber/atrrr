#' app_bsky_feed_describe_feed_generator
#' Returns information about a given feed generator including TOS & offered feed URIs
#' @noRd
app_bsky_feed_describe_feed_generator <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.describeFeedGenerator",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}


#' app_bsky_feed_get_actor_feeds
#' Retrieve a list of feeds created by a given actor
#' @noRd
app_bsky_feed_get_actor_feeds <- function(actor, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.getActorFeeds",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_get_actor_likes
#' A view of the posts liked by an actor.
#' @noRd
app_bsky_feed_get_actor_likes <- function(actor, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.getActorLikes",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_get_author_feed
#' A view of an actor's feed.
#' @noRd
app_bsky_feed_get_author_feed <- function(actor, limit = NULL, cursor = NULL, filter = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.getAuthorFeed",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_get_feed
#' Compose and hydrate a feed from a user's selected feed generator
#' @noRd
app_bsky_feed_get_feed <- function(feed, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.getFeed",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_get_feed_generator
#' Get information about a specific feed offered by a feed generator, such as its online status
#' @noRd
app_bsky_feed_get_feed_generator <- function(feed, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.getFeedGenerator",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_get_feed_generators
#' Get information about a list of feed generators
#' @noRd
app_bsky_feed_get_feed_generators <- function(feeds, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.getFeedGenerators",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_get_feed_skeleton
#' A skeleton of a feed provided by a feed generator
#' @noRd
app_bsky_feed_get_feed_skeleton <- function(feed, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.getFeedSkeleton",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_get_likes
#'
#' @noRd
app_bsky_feed_get_likes <- function(uri, cid = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.getLikes",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_get_list_feed
#' A view of a recent posts from actors in a list
#' @noRd
app_bsky_feed_get_list_feed <- function(list, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.getListFeed",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_get_post_thread
#'
#' @noRd
app_bsky_feed_get_post_thread <- function(uri, depth = NULL, parentHeight = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.getPostThread",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_get_posts
#' A view of an actor's feed.
#' @noRd
app_bsky_feed_get_posts <- function(uris, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.getPosts",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_get_reposted_by
#'
#' @noRd
app_bsky_feed_get_reposted_by <- function(uri, cid = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.getRepostedBy",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_get_suggested_feeds
#' Get a list of suggested feeds for the viewer.
#' @noRd
app_bsky_feed_get_suggested_feeds <- function(limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.getSuggestedFeeds",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_get_timeline
#' A view of the user's home timeline.
#' @noRd
app_bsky_feed_get_timeline <- function(algorithm = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.getTimeline",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_search_posts
#' Find posts matching search criteria
#' @noRd
app_bsky_feed_search_posts <- function(q, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.searchPosts",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}
