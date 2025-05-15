# chat functions require the URL of the service endpoint rather than "bsky.social"
# TODO: find way to not have separate make_request_chat and make_request
chat_bsky_convo_list_convos2 <- function(limit = NULL, cursor = NULL, readState = NULL, status = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request_chat(
    pathname = "/xrpc/chat.bsky.convo.listConvos",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}

#' Interact with Bluesky Direct Messages
#'
#' @param unread `TRUE`/`FALSE` only show chats with unread messages.
#' @param status `request` or `accepted`.
#' @inheritParams search_user
#'
#' @export
#' @returns a data frame of chats.
#'
#' @examples
#' \dontrun{
#' list_chats(readState = "read")
#' }
list_chats <- function(limit = NULL, cursor = NULL, unread = FALSE, status = NULL, parse = TRUE, .token = NULL) {
  resp <- do.call(
    what = chat_bsky_convo_list_convos2,
    args = list(
      limit = limit,
      cursor = cursor,
      readState = "unread"[only_unread],
      status = status,
      .token = .token,
      .return = "json"
    ))

  if (!parse) {
    return(resp)
  }
  resp |>
    purrr::pluck("convos") |>
    purrr::map(as_tibble_onerow) |>
    dplyr::bind_rows()
}
