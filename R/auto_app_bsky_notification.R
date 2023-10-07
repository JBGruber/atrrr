#' app_bsky_notification_get_unread_count
#'
#' @noRd
app_bsky_notification_get_unread_count <- function(seenAt = NULL, .token = NULL, .return = c("json", "resp")) {
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
#'
#' @noRd
app_bsky_notification_list_notifications <- function(limit = NULL, cursor = NULL, seenAt = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.notification.listNotifications",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_notification_register_push
#' Register for push notifications with a service
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
#' Notify server that the user has seen notifications.
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
