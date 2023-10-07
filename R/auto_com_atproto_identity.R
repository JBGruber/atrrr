#' com_atproto_identity_resolve_handle
#' Provides the DID of a repo.
#' @noRd
com_atproto_identity_resolve_handle <- function(handle, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.identity.resolveHandle",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_identity_update_handle
#' Updates the handle of the account
#' @noRd
com_atproto_identity_update_handle <- function(handle, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.identity.updateHandle",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}
