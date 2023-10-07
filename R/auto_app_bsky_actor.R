#' app_bsky_actor_get_preferences
#' Get private preferences attached to the account.
#' @noRd
app_bsky_actor_get_preferences <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.actor.getPreferences",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_actor_get_profile
#'
#' @noRd
app_bsky_actor_get_profile <- function(actor, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.actor.getProfile",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_actor_get_profiles
#'
#' @noRd
app_bsky_actor_get_profiles <- function(actors, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.actor.getProfiles",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_actor_get_suggestions
#' Get a list of actors suggested for following. Used in discovery UIs.
#' @noRd
app_bsky_actor_get_suggestions <- function(limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.actor.getSuggestions",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_actor_put_preferences
#' Sets the private preferences attached to the account.
#' @noRd
app_bsky_actor_put_preferences <- function(preferences, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.actor.putPreferences",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' app_bsky_actor_search_actors
#' Find actors (profiles) matching search criteria.
#' @noRd
app_bsky_actor_search_actors <- function(term = NULL, q = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.actor.searchActors",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_actor_search_actors_typeahead
#' Find actor suggestions for a search term.
#' @noRd
app_bsky_actor_search_actors_typeahead <- function(term = NULL, q = NULL, limit = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.actor.searchActorsTypeahead",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}
