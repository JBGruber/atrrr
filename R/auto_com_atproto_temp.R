#' com_atproto_temp_add_reserved_handle
#' Add a handle to the set of reserved handles.
#' @noRd
com_atproto_temp_add_reserved_handle <- function(handle, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.temp.addReservedHandle",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_temp_check_signup_queue
#' Check accounts location in signup queue.
#' @noRd
com_atproto_temp_check_signup_queue <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.temp.checkSignupQueue",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_temp_fetch_labels
#' DEPRECATED: use queryLabels or subscribeLabels instead -- Fetch all labels from a labeler created after a certain date.
#' @noRd
com_atproto_temp_fetch_labels <- function(since = NULL, limit = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.temp.fetchLabels",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_temp_request_phone_verification
#' Request a verification code to be sent to the supplied phone number
#' @noRd
com_atproto_temp_request_phone_verification <- function(phoneNumber, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.temp.requestPhoneVerification",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}
