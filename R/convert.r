#' Converts betweet http URL and AT URI
#'
#' @details The AT protocol uses a different scheme to link to posts, useser,
#' feeds etc. Instead of the common https:// link format, internally a links
#' starting with at:// are used (see <https://atproto.com/specs/at-uri-scheme>
#' for details). The functions convert links from the HTTP to the AT format, or
#' the other way around. This is useful if you want to use a link in a browser.
#'
#' @param link either an AT or HTTP link.
#' @inheritParams search_user
#'
#' @return either an AT or HTTP link
#' @export
#'
#' @examples
#' \dontrun{
#' convert_http_to_at("https://bsky.app/profile/benguinaudeau.bsky.social/post/3kbi5v7oncq25")
#' convert_at_to_http("at://did:plc:vuvsifrusnjsys7mhkpk662u/app.bsky.feed.post/3kbi5v7oncq25")
#' }
convert_http_to_at <- function(link,
                               .token = NULL) {


  purrr::map_chr(link, function(l) {

    # if at is already supplied
    if (is_at(l)) return(l)

    http_info <- parse_http_url(l)

    if (is.na(http_info$repo) | is.na(http_info$rkey)) return(NA_character_)

    if(!is_did(http_info$repo)) {
      http_info$repo <- resolve_handle(http_info$repo, .token = .token)
    }

    glue::glue("at://{repo}/{collection}/{rkey}", .envir = http_info)

  })

}

#' @rdname convert_http_to_at
#' @export
convert_at_to_http <- function(link) {

  at_info <- parse_at_uri(link)

  purrr::map2_chr(at_info$repo, at_info$rkey, function(r, k) {

    if (is.na(r) | is.na(k)) return(NA_character_)

    handle <-  did_lookup(r) |>
      sub("^at://", "", x = _)

    glue::glue("https://bsky.app/profile/{handle}/post/{k}")

  })
}

