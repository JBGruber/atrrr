#' app_bsky_graph_get_actor_starter_packs
#' Get a list of starter packs created by the actor.
#' @noRd
app_bsky_graph_get_actor_starter_packs <- function(actor, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.getActorStarterPacks",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_graph_get_blocks
#' Who is the requester's account blocking?
#' @noRd
app_bsky_graph_get_blocks <- function(limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.getBlocks",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_graph_get_followers
#' Who is following an actor?
#' @noRd
app_bsky_graph_get_followers <- function(actor, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.getFollowers",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_graph_get_follows
#' Who is an actor following?
#' @noRd
app_bsky_graph_get_follows <- function(actor, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.getFollows",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_graph_get_known_followers
#' Enumerates accounts which follow a specified account (actor) and are followed by the viewer.
#' @noRd
app_bsky_graph_get_known_followers <- function(actor, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.getKnownFollowers",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_graph_get_list
#' Fetch a list of actors
#' @noRd
app_bsky_graph_get_list <- function(list, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.getList",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_graph_get_list_blocks
#' Which lists is the requester's account blocking?
#' @noRd
app_bsky_graph_get_list_blocks <- function(limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.getListBlocks",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_graph_get_list_mutes
#' Which lists is the requester's account muting?
#' @noRd
app_bsky_graph_get_list_mutes <- function(limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.getListMutes",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_graph_get_lists
#' Fetch a list of lists that belong to an actor
#' @noRd
app_bsky_graph_get_lists <- function(actor, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.getLists",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_graph_get_mutes
#' Who does the viewer mute?
#' @noRd
app_bsky_graph_get_mutes <- function(limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.getMutes",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_graph_get_relationships
#' Enumerates public relationships between one account, and a list of other accounts. Does not require auth.
#' @noRd
app_bsky_graph_get_relationships <- function(actor, others = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.getRelationships",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_graph_get_starter_pack
#' Gets a view of a starter pack.
#' @noRd
app_bsky_graph_get_starter_pack <- function(starterPack, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.getStarterPack",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_graph_get_starter_packs
#' Get views for a list of starter packs.
#' @noRd
app_bsky_graph_get_starter_packs <- function(uris, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.getStarterPacks",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_graph_get_suggested_follows_by_actor
#' Get suggested follows related to a given actor.
#' @noRd
app_bsky_graph_get_suggested_follows_by_actor <- function(actor, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.getSuggestedFollowsByActor",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_graph_mute_actor
#' Mute an actor by did or handle.
#' @noRd
app_bsky_graph_mute_actor <- function(actor, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.muteActor",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' app_bsky_graph_mute_actor_list
#' Mute a list of actors.
#' @noRd
app_bsky_graph_mute_actor_list <- function(list, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.muteActorList",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' app_bsky_graph_mute_thread
#' Mutes a thread preventing notifications from the thread and any of its children. Mutes are private in Bluesky. Requires auth.
#' @noRd
app_bsky_graph_mute_thread <- function(root, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.muteThread",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' app_bsky_graph_search_starter_packs
#' Find starter packs matching search criteria. Does not require auth.
#' @noRd
app_bsky_graph_search_starter_packs <- function(q, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.searchStarterPacks",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_graph_unmute_actor
#' Unmute an actor by did or handle.
#' @noRd
app_bsky_graph_unmute_actor <- function(actor, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.unmuteActor",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' app_bsky_graph_unmute_actor_list
#' Unmute a list of actors.
#' @noRd
app_bsky_graph_unmute_actor_list <- function(list, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.unmuteActorList",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' app_bsky_graph_unmute_thread
#' Unmutes the specified thread. Requires auth.
#' @noRd
app_bsky_graph_unmute_thread <- function(root, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.unmuteThread",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}
