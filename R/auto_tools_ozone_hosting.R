#' tools_ozone_hosting_get_account_history
#' Get account history, e.g. log of updated email addresses or other identity information.
#' @noRd
tools_ozone_hosting_get_account_history <- function(did, events = NULL, cursor = NULL, limit = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/tools.ozone.hosting.getAccountHistory",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}
