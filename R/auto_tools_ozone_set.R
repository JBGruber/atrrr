#' tools_ozone_set_add_values
#' Add values to a specific set. Attempting to add values to a set that does not exist will result in an error.
#' @noRd
tools_ozone_set_add_values <- function(name, values, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/tools.ozone.set.addValues",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' tools_ozone_set_delete_set
#' Delete an entire set. Attempting to delete a set that does not exist will result in an error.
#' @noRd
tools_ozone_set_delete_set <- function(name, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/tools.ozone.set.deleteSet",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' tools_ozone_set_delete_values
#' Delete values from a specific set. Attempting to delete values that are not in the set will not result in an error
#' @noRd
tools_ozone_set_delete_values <- function(name, values, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/tools.ozone.set.deleteValues",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' tools_ozone_set_get_values
#' Get a specific set and its values
#' @noRd
tools_ozone_set_get_values <- function(name, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/tools.ozone.set.getValues",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' tools_ozone_set_query_sets
#' Query available sets
#' @noRd
tools_ozone_set_query_sets <- function(limit = NULL, cursor = NULL, namePrefix = NULL, sortBy = NULL, sortDirection = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/tools.ozone.set.querySets",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' tools_ozone_set_upsert_set
#' Create or update set metadata
#' @noRd
tools_ozone_set_upsert_set <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/tools.ozone.set.upsertSet",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}
