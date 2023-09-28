#' This will become a description
#'
#' @param repo target github repository
#'
#' @return 
#' @export
#'
#' @examples
app_bsky_feed_get_list_feed <- function(list, limit = NULL, cursor = NULL){

    get_params <<- get_params <- match.call(expand.dots = FALSE) |>
flatten_query_params()
  
  list(
    scheme = 'https', 
    hostname = glue::glue('bsky.social/xrpc/app.bsky.feed.getListFeed'),
    query = as.list(get_params)
  ) |>
    httr2::url_build() |>
    httr2::request() |> 
    httr2::req_method('GET') |>
    httr2::req_headers(
      Authorization = paste0('Bearer ', token$accessJwt)
    ) |> 
    httr2::req_perform() |> 
    httr2::resp_body_json()
}
