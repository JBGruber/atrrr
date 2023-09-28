app_bsky_feed_get_author_feed <- function(actor, limit = NULL, cursor = NULL, filter = NULL){
    
     get_params <<- get_params <- match.call(expand.dots = FALSE) |>
    flatten_query_params()
  
  list(
    scheme = "https", 
    hostname = glue::glue("bsky.social/xrpc/app.bsky.feed.getAuthorFeed"),
    query = as.list(get_params)
  ) |>
    httr2::url_build() |>
    httr2::request() |> 
    httr2::req_method("GET") |>
    httr2::req_headers(
      Authorization = paste0("Bearer ", token$accessJwt)
    ) |> 
    httr2::req_perform() |> 
    httr2::resp_body_json()
}
