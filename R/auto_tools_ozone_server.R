#' tools_ozone_server_get_config
#' Get details about ozone's server configuration.
#' @noRd
tools_ozone_server_get_config <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/tools.ozone.server.getConfig",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}
