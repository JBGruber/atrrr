#' chat_bsky_convo_delete_message_for_self
#' 
#' @noRd
chat_bsky_convo_delete_message_for_self <- function(convoId, messageId, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/chat.bsky.convo.deleteMessageForSelf",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' chat_bsky_convo_get_convo
#' 
#' @noRd
chat_bsky_convo_get_convo <- function(convoId, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/chat.bsky.convo.getConvo",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' chat_bsky_convo_get_convo_for_members
#' 
#' @noRd
chat_bsky_convo_get_convo_for_members <- function(members, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/chat.bsky.convo.getConvoForMembers",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' chat_bsky_convo_get_log
#' 
#' @noRd
chat_bsky_convo_get_log <- function(cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/chat.bsky.convo.getLog",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' chat_bsky_convo_get_messages
#' 
#' @noRd
chat_bsky_convo_get_messages <- function(convoId, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/chat.bsky.convo.getMessages",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' chat_bsky_convo_leave_convo
#' 
#' @noRd
chat_bsky_convo_leave_convo <- function(convoId, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/chat.bsky.convo.leaveConvo",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' chat_bsky_convo_list_convos
#' 
#' @noRd
chat_bsky_convo_list_convos <- function(limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/chat.bsky.convo.listConvos",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' chat_bsky_convo_mute_convo
#' 
#' @noRd
chat_bsky_convo_mute_convo <- function(convoId, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/chat.bsky.convo.muteConvo",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' chat_bsky_convo_send_message
#' 
#' @noRd
chat_bsky_convo_send_message <- function(convoId, message, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/chat.bsky.convo.sendMessage",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' chat_bsky_convo_send_message_batch
#' 
#' @noRd
chat_bsky_convo_send_message_batch <- function(items, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/chat.bsky.convo.sendMessageBatch",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' chat_bsky_convo_unmute_convo
#' 
#' @noRd
chat_bsky_convo_unmute_convo <- function(convoId, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/chat.bsky.convo.unmuteConvo",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' chat_bsky_convo_update_read
#' 
#' @noRd
chat_bsky_convo_update_read <- function(convoId, messageId = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/chat.bsky.convo.updateRead",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}
