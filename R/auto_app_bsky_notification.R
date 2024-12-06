#' app_bsky_notification_get_unread_count
#' Count the number of unread notifications for the requesting account. Requires auth.
#' @noRd
app_bsky_notification_get_unread_count <- function(priority = NULL, seenAt = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.notification.getUnreadCount",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_notification_list_notifications
#' Enumerate notifications for the requesting account. Requires auth.
#' @noRd
app_bsky_notification_list_notifications <- function(limit = NULL, priority = NULL, cursor = NULL, seenAt = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.notification.listNotifications",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_notification_put_preferences
#' Set notification-related preferences for an account. Requires auth.
#' @noRd
app_bsky_notification_put_preferences <- function(priority, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.notification.putPreferences",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' app_bsky_notification_register_push
#' Register to receive push notifications, via a specified service, for the requesting account. Requires auth.
#' @noRd
app_bsky_notification_register_push <- function(serviceDid, token, platform, appId, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.notification.registerPush",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' app_bsky_notification_update_seen
#' Notify server that the requesting account has seen notifications. Requires auth.
#' @noRd
app_bsky_notification_update_seen <- function(seenAt, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.notification.updateSeen",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}
