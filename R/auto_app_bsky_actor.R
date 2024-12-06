#' app_bsky_actor_get_preferences
#' Get private preferences attached to the current account. Expected use is synchronization between multiple devices, and import/export during account migration. Requires auth.
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
#' Get detailed profile view of an actor. Does not require auth, but contains relevant metadata with auth.
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
#' Get detailed profile views of multiple actors.
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
#' Get a list of suggested actors. Expected use is discovery of accounts to follow during new account onboarding.
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
#' Set the private preferences attached to the account.
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
#' Find actors (profiles) matching search criteria. Does not require auth.
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
#' Find actor suggestions for a prefix search term. Expected use is for auto-completion during text field entry. Does not require auth.
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
