#' com_atproto_identity_get_recommended_did_credentials
#' Describe the credentials that should be included in the DID doc of an account that is migrating to this service.
#' @noRd
com_atproto_identity_get_recommended_did_credentials <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.identity.getRecommendedDidCredentials",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_identity_request_plc_operation_signature
#' Request an email with a code to in order to request a signed PLC operation. Requires Auth.
#' @noRd
com_atproto_identity_request_plc_operation_signature <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.identity.requestPlcOperationSignature",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_identity_resolve_handle
#' Resolves a handle (domain name) to a DID.
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



#' com_atproto_identity_sign_plc_operation
#' Signs a PLC operation to update some value(s) in the requesting DID's document.
#' @noRd
com_atproto_identity_sign_plc_operation <- function(token = NULL, rotationKeys = NULL, alsoKnownAs = NULL, verificationMethods = NULL, services = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.identity.signPlcOperation",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_identity_submit_plc_operation
#' Validates a PLC operation to ensure that it doesn't violate a service's constraints or get the identity into a bad state, then submits it to the PLC registry
#' @noRd
com_atproto_identity_submit_plc_operation <- function(operation, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.identity.submitPlcOperation",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_identity_update_handle
#' Updates the current account's handle. Verifies handle validity, and updates did:plc document if necessary. Implemented by PDS, and requires auth.
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
