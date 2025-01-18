#' Get Starter Pack
#'
#' Get all info about a starter pack and the users on it.
#'
#' @param starter_pack the URL of a starter pack
#' @inheritParams search_user
#'
#' @returns a data frame of users and list info
#' @export
#'
#' @examples
#' \dontrun{
#' get_starter_pack("https://bsky.app/starter-pack/sof14g1l.bsky.social/3lbc4bqetfp22")
#' }
get_starter_pack <- function(starter_pack,
                              .token = NULL) {

  starter_pack_uri <- convert_http_to_at(starter_pack, .token = .token)
  res <- do.call(app_bsky_graph_get_starter_pack, list(starter_pack_uri, .token = .token))
  return(parse_list(res))

}
