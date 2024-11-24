#' app_bsky_labeler_get_services
#' Get information about a list of labeler services.
#' @noRd
app_bsky_labeler_get_services <- function(dids, detailed = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/app.bsky.labeler.getServices",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}
