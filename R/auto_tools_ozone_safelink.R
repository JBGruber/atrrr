#' tools_ozone_safelink_add_rule
#' Add a new URL safety rule
#' @noRd
tools_ozone_safelink_add_rule <- function(url, pattern, action, reason, comment = NULL, createdBy = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/tools.ozone.safelink.addRule",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' tools_ozone_safelink_query_events
#' Query URL safety audit events
#' @noRd
tools_ozone_safelink_query_events <- function(cursor = NULL, limit = NULL, urls = NULL, patternType = NULL, sortDirection = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/tools.ozone.safelink.queryEvents",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' tools_ozone_safelink_query_rules
#' Query URL safety rules
#' @noRd
tools_ozone_safelink_query_rules <- function(cursor = NULL, limit = NULL, urls = NULL, patternType = NULL, actions = NULL, reason = NULL, createdBy = NULL, sortDirection = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/tools.ozone.safelink.queryRules",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' tools_ozone_safelink_remove_rule
#' Remove an existing URL safety rule
#' @noRd
tools_ozone_safelink_remove_rule <- function(url, pattern, comment = NULL, createdBy = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/tools.ozone.safelink.removeRule",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' tools_ozone_safelink_update_rule
#' Update an existing URL safety rule
#' @noRd
tools_ozone_safelink_update_rule <- function(url, pattern, action, reason, comment = NULL, createdBy = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/tools.ozone.safelink.updateRule",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}
