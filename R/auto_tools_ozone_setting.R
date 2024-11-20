#' tools_ozone_setting_list_options
#' List settings with optional filtering
#' @noRd
tools_ozone_setting_list_options <- function(limit = NULL, cursor = NULL, scope = NULL, prefix = NULL, keys = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/tools.ozone.setting.listOptions",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' tools_ozone_setting_remove_options
#' Delete settings by key
#' @noRd
tools_ozone_setting_remove_options <- function(keys, scope, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/tools.ozone.setting.removeOptions",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' tools_ozone_setting_upsert_option
#' Create or update setting option
#' @noRd
tools_ozone_setting_upsert_option <- function(key, scope, value, description = NULL, managerRole = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/tools.ozone.setting.upsertOption",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}
