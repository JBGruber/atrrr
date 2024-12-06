#' com_atproto_moderation_create_report
#' Submit a moderation report regarding an atproto account or record. Implemented by moderation services (with PDS proxying), and requires auth.
#' @noRd
com_atproto_moderation_create_report <- function(reasonType, subject, reason = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.moderation.createReport",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}
