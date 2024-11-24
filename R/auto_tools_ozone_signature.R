#' tools_ozone_signature_find_correlation
#' Find all correlated threat signatures between 2 or more accounts.
#' @noRd
tools_ozone_signature_find_correlation <- function(dids, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/tools.ozone.signature.findCorrelation",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' tools_ozone_signature_find_related_accounts
#' Get accounts that share some matching threat signatures with the root account.
#' @noRd
tools_ozone_signature_find_related_accounts <- function(did, cursor = NULL, limit = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/tools.ozone.signature.findRelatedAccounts",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' tools_ozone_signature_search_accounts
#' Search for accounts that match one or more threat signature values.
#' @noRd
tools_ozone_signature_search_accounts <- function(values, cursor = NULL, limit = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/tools.ozone.signature.searchAccounts",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}
