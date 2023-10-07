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
