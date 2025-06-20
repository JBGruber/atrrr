#' tools_ozone_verification_grant_verifications
#' Grant verifications to multiple subjects. Allows batch processing of up to 100 verifications at once.
#' @noRd
tools_ozone_verification_grant_verifications <- function(verifications, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/tools.ozone.verification.grantVerifications",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' tools_ozone_verification_list_verifications
#' List verifications
#' @noRd
tools_ozone_verification_list_verifications <- function(cursor = NULL, limit = NULL, createdAfter = NULL, createdBefore = NULL, issuers = NULL, subjects = NULL, sortDirection = NULL, isRevoked = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/tools.ozone.verification.listVerifications",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' tools_ozone_verification_revoke_verifications
#' Revoke previously granted verifications in batches of up to 100.
#' @noRd
tools_ozone_verification_revoke_verifications <- function(uris, revokeReason = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/tools.ozone.verification.revokeVerifications",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}
