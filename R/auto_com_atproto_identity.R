



#' com_atproto_identity_resolve_handle
#' Provides the DID of a repo.
#' @export
com_atproto_identity_resolve_handle <- function(handle, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.identity.resolveHandle",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' com_atproto_identity_update_handle
#' Updates the handle of the account
#' @export
com_atproto_identity_update_handle <- function(handle, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.identity.updateHandle",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}
