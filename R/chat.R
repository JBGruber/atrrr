# chat functions require the URL of the service endpoint rather than "bsky.social"
# TODO: find way to not have separate make_request_chat and make_request
chat_bsky_convo_list_convos2 <- function(limit = NULL, cursor = NULL, readState = NULL, status = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "/xrpc/chat.bsky.convo.listConvos",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET",
    chat = TRUE
  )
}

#' Interact with Bluesky Direct Messages
#'
#' @param unread `TRUE`/`FALSE` only show chats with unread messages.
#' @param status `request` or `accepted`.
#' @param actor user DID or handle to get chats for.
#' @param chat_id id of the chat. You can get it with `list_chats`,
#'   `get_user_chat`, or `check_user_chat_available`.
#' @param text text to send to other user.
#' @inheritParams search_user
#'
#' @export
#' @returns different objects.
#'
#' @examples
#' \dontrun{
#' list_chats(readState = "read")
#' }
list_chats <- function(limit = NULL, cursor = NULL, unread = FALSE, status = NULL, parse = TRUE, .token = NULL) {
  if (!is.logical(unread)) {
    cli::cli_abort("`unread` must be logical ({.code TRUE}/{.code FALSE})")
  }
  resp <- do.call(
    what = chat_bsky_convo_list_convos2,
    args = list(
      limit = limit,
      cursor = cursor,
      readState = "unread"[unread],
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


chat_bsky_convo_get_convo_for_members2 <- function(members, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "/xrpc/chat.bsky.convo.getConvoForMembers",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET",
    chat = TRUE
  )
}

#' @rdname list_chats
#' @export
get_user_chat <- function(actor, parse = TRUE, .token = NULL) {
  if (length(actor) != 1L) {
    cli::cli_abort(
      c("You can only get chats with 1 actor at a time. Use ",
        "{.help list_chats} if you want to look for multiple chats.")
    )
  }
  if (!is_did(actor)) {
    actor <- get_user_info(actor)$did
  }

  resp <- do.call(
    what = chat_bsky_convo_get_convo_for_members2,
    args = list(
      members = actor,
      .token = .token,
      .return = "json"
    ))
  if (!parse) {
    return(resp)
  }
  resp |>
    purrr::pluck("convo") |>
    as_tibble_onerow()
}


chat_bsky_convo_get_convo_availability2 <- function(members, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "/xrpc/chat.bsky.convo.getConvoAvailability",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET",
    chat = TRUE
  )
}


#' @rdname list_chats
#' @export
check_user_chat_available <- function(actor, parse = TRUE, .token = NULL) {
  if (!is_did(actor)) {
    actor <- get_user_info(actor)$did
  }
  resp <- do.call(
    what = chat_bsky_convo_get_convo_availability2,
    args = list(
      members = actor,
      .token = .token,
      .return = "json"
    ))

  if (!parse) {
    return(resp)
  }
  resp |>
    purrr::pluck("convo") |>
    as_tibble_onerow()
}


chat_bsky_convo_send_message2 <- function(convoId, message, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "/xrpc/chat.bsky.convo.sendMessage",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST",
    chat = TRUE
  )
}


#' @rdname list_chats
#' @export
send_chat_message <- function(chat_id, text, .token = NULL) {
  message <- list(text = text)

  parsed_richtext <- parse_facets(text)
  if (length(parsed_richtext) > 0) {
    message[["facets"]] <- parsed_richtext
  }
  types <- purrr::map_chr(parsed_richtext, list("features", 1L, "$type"))
  if ("app.bsky.richtext.facet#link" %in% types) {
    uri <- purrr::map_chr(parsed_richtext, function(f)
      purrr::pluck(f, "features", 1, "uri", .default = NA_character_)) |>
      stats::na.omit() |>
      utils::head(1L) # only one link can be previewed

    if (length(uri) > 0L) {
      # preview card
      message[["embed"]] <- fetch_preview(uri)
    }
  }

  do.call(
    what = chat_bsky_convo_send_message2,
    args = list(
      convoId = chat_id,
      message = message,
      .token = .token,
      .return = "json"
    ))
}

