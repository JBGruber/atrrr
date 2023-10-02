#'
#' This function is used for fetching the private settings or preferences associated with a user's account.
#'
#' @import httr2
#' @importFrom glue glue
#'
#' @return A list representing the account's preferences.
#' @export
#'
#' @examples
#' \dontrun{
#' account_preferences <- actor_get_preferences()
#' }
actor_get_preferences <- function(token = NULL) {
  get_params <<- get_params <- match.call(expand.dots = FALSE) |>
    flatten_query_params()

  if (is.null(token)) token <- get_token()

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.actor.getPreferences"),
    query = as.list(get_params)
  ) |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method("GET") |>
    httr2::req_auth_bearer_token(token = token$accessJwt) |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
