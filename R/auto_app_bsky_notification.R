#' app_bsky_notification_get_preferences
#' Get notification-related preferences for an account. Requires auth.
#' @noRd
app_bsky_notification_get_preferences <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.notification.getPreferences",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_notification_get_unread_count
#' Count the number of unread notifications for the requesting account. Requires auth.
#' @noRd
app_bsky_notification_get_unread_count <- function(priority = NULL, seenAt = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.notification.getUnreadCount",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_notification_list_activity_subscriptions
#' Enumerate all accounts to which the requesting account is subscribed to receive notifications for. Requires auth.
#' @noRd
app_bsky_notification_list_activity_subscriptions <- function(limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.notification.listActivitySubscriptions",
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
app_bsky_notification_list_notifications <- function(reasons = NULL, limit = NULL, priority = NULL, cursor = NULL, seenAt = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.notification.listNotifications",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_notification_put_activity_subscription
#' Puts an activity subscription entry. The key should be omitted for creation and provided for updates. Requires auth.
#' @noRd
app_bsky_notification_put_activity_subscription <- function(subject, activitySubscription, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.notification.putActivitySubscription",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' app_bsky_notification_put_preferences
#' Set notification-related preferences for an account. Requires auth.
#' @noRd
app_bsky_notification_put_preferences <- function(priority, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.notification.putPreferences",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' app_bsky_notification_put_preferences_v2
#' Set notification-related preferences for an account. Requires auth.
#' @noRd
app_bsky_notification_put_preferences_v2 <- function(chat = NULL, follow = NULL, like = NULL, likeViaRepost = NULL, mention = NULL, quote = NULL, reply = NULL, repost = NULL, repostViaRepost = NULL, starterpackJoined = NULL, subscribedPost = NULL, unverified = NULL, verified = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.notification.putPreferencesV2",
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
    name = "bsky.social/xrpc/app.bsky.notification.registerPush",
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
    name = "bsky.social/xrpc/app.bsky.notification.updateSeen",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}
