#' chat_bsky_moderation_get_actor_metadata
#' 
#' @noRd
chat_bsky_moderation_get_actor_metadata <- function(actor, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/chat.bsky.moderation.getActorMetadata",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' chat_bsky_moderation_get_message_context
#' 
#' @noRd
chat_bsky_moderation_get_message_context <- function(messageId, convoId = NULL, before = NULL, after = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/chat.bsky.moderation.getMessageContext",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' chat_bsky_moderation_update_actor_access
#' 
#' @noRd
chat_bsky_moderation_update_actor_access <- function(actor, allowAccess, ref = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/chat.bsky.moderation.updateActorAccess",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}
