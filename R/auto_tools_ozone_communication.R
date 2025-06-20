#' tools_ozone_communication_create_template
#' Administrative action to create a new, re-usable communication (email for now) template.
#' @noRd
tools_ozone_communication_create_template <- function(name, contentMarkdown, subject, lang = NULL, createdBy = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/tools.ozone.communication.createTemplate",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' tools_ozone_communication_delete_template
#' Delete a communication template.
#' @noRd
tools_ozone_communication_delete_template <- function(id, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/tools.ozone.communication.deleteTemplate",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' tools_ozone_communication_list_templates
#' Get list of all communication templates.
#' @noRd
tools_ozone_communication_list_templates <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/tools.ozone.communication.listTemplates",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' tools_ozone_communication_update_template
#' Administrative action to update an existing communication template. Allows passing partial fields to patch specific fields only.
#' @noRd
tools_ozone_communication_update_template <- function(id, name = NULL, lang = NULL, contentMarkdown = NULL, subject = NULL, updatedBy = NULL, disabled = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/tools.ozone.communication.updateTemplate",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}
