#' chat_bsky_actor_delete_account
#' 
#' @noRd
chat_bsky_actor_delete_account <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/chat.bsky.actor.deleteAccount",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' chat_bsky_actor_export_account_data
#' 
#' @noRd
chat_bsky_actor_export_account_data <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/chat.bsky.actor.exportAccountData",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}
