#' app_bsky_feed_describe_feed_generator
#' Get information about a feed generator, including policies and offered feed URIs. Does not require auth; implemented by Feed Generator services (not App View).
#' @noRd
app_bsky_feed_describe_feed_generator <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.feed.describeFeedGenerator",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_get_actor_feeds
#' Get a list of feeds (feed generator records) created by the actor (in the actor's repo).
#' @noRd
app_bsky_feed_get_actor_feeds <- function(actor, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.feed.getActorFeeds",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_get_actor_likes
#' Get a list of posts liked by an actor. Requires auth, actor must be the requesting account.
#' @noRd
app_bsky_feed_get_actor_likes <- function(actor, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.feed.getActorLikes",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_get_author_feed
#' Get a view of an actor's 'author feed' (post and reposts by the author). Does not require auth.
#' @noRd
app_bsky_feed_get_author_feed <- function(actor, limit = NULL, cursor = NULL, filter = NULL, includePins = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.feed.getAuthorFeed",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_get_feed
#' Get a hydrated feed from an actor's selected feed generator. Implemented by App View.
#' @noRd
app_bsky_feed_get_feed <- function(feed, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.feed.getFeed",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_get_feed_generator
#' Get information about a feed generator. Implemented by AppView.
#' @noRd
app_bsky_feed_get_feed_generator <- function(feed, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.feed.getFeedGenerator",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_get_feed_generators
#' Get information about a list of feed generators.
#' @noRd
app_bsky_feed_get_feed_generators <- function(feeds, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.feed.getFeedGenerators",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_get_feed_skeleton
#' Get a skeleton of a feed provided by a feed generator. Auth is optional, depending on provider requirements, and provides the DID of the requester. Implemented by Feed Generator Service.
#' @noRd
app_bsky_feed_get_feed_skeleton <- function(feed, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.feed.getFeedSkeleton",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_get_likes
#' Get like records which reference a subject (by AT-URI and CID).
#' @noRd
app_bsky_feed_get_likes <- function(uri, cid = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.feed.getLikes",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_get_list_feed
#' Get a feed of recent posts from a list (posts and reposts from any actors on the list). Does not require auth.
#' @noRd
app_bsky_feed_get_list_feed <- function(list, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.feed.getListFeed",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_get_post_thread
#' Get posts in a thread. Does not require auth, but additional metadata and filtering will be applied for authed requests.
#' @noRd
app_bsky_feed_get_post_thread <- function(uri, depth = NULL, parentHeight = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.feed.getPostThread",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_get_posts
#' Gets post views for a specified list of posts (by AT-URI). This is sometimes referred to as 'hydrating' a 'feed skeleton'.
#' @noRd
app_bsky_feed_get_posts <- function(uris, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.feed.getPosts",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_get_quotes
#' Get a list of quotes for a given post.
#' @noRd
app_bsky_feed_get_quotes <- function(uri, cid = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.feed.getQuotes",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_get_reposted_by
#' Get a list of reposts for a given post.
#' @noRd
app_bsky_feed_get_reposted_by <- function(uri, cid = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.feed.getRepostedBy",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_get_suggested_feeds
#' Get a list of suggested feeds (feed generators) for the requesting account.
#' @noRd
app_bsky_feed_get_suggested_feeds <- function(limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.feed.getSuggestedFeeds",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_get_timeline
#' Get a view of the requesting account's home timeline. This is expected to be some form of reverse-chronological feed.
#' @noRd
app_bsky_feed_get_timeline <- function(algorithm = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.feed.getTimeline",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_search_posts
#' Find posts matching search criteria, returning views of those posts.
#' @noRd
app_bsky_feed_search_posts <- function(q, sort = NULL, since = NULL, until = NULL, mentions = NULL, author = NULL, lang = NULL, domain = NULL, url = NULL, tag = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.feed.searchPosts",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_feed_send_interactions
#' Send information about interactions with feed items back to the feed generator that served them.
#' @noRd
app_bsky_feed_send_interactions <- function(interactions, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.feed.sendInteractions",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}
