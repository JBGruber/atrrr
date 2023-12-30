#' To ensure consistency, all functions that retrieve posts use this function to
#' turn them into a data.frame.
#' @noRd
parse_post_list <- function(post_list) {
  tibble::tibble(
    uri           = purrr::map_chr(post_list, "uri"),
    cid           = purrr::map_chr(post_list, "cid"),
    author_handle = purrr::map_chr(post_list, c("author", "handle"),
                                   .default = NA_character_),
    author_name   = purrr::map_chr(post_list, c("author", "displayName"),
                                   .default = NA_character_),
    text          = purrr::map_chr(post_list, c("record", "text"),
                                   .default = NA_character_),
    author_data   = purrr::map(post_list, "author"),
    record_data   = purrr::map(post_list, "record"),
    embed_data    = purrr::map(post_list, "embed"),
    replyCount    = purrr::map_int(post_list, "replyCount",
                                   .default = NA_integer_),
    repostCount   = purrr::map_int(post_list, "repostCount",
                                   .default = NA_integer_),
    likeCount     = purrr::map_int(post_list, "likeCount",
                                   .default = NA_integer_),
    indexedAt     = parse_time(purrr::map_chr(post_list, "indexedAt")),
    # TODO: return URL instead of URI
    in_reply_to   = purrr::map_chr(post_list, c("record", "reply", "parent", "uri"),
                                   .default = NA_character_),
    in_reply_root = purrr::map_chr(post_list, c("record", "reply", "root", "uri"),
                                   .default = NA_character_),
  )
}


#' threads parser
#' @noRd
parse_threads <- function(thread) {

  post_list <- list(purrr::pluck(thread, "thread", "post"))

  replies <- purrr::pluck(thread, "thread", "replies")

  while (length(replies) > 0) {
    post_list <- c(post_list, purrr::map(replies, "post"))
    replies <- purrr::map(replies, "replies") |>
      purrr::flatten()
  }

  parse_post_list(post_list)
}


#' timeline parser
#' @noRd
parse_timeline <- function(res) {
  post_list <- purrr::map(res, "post", .default = list())
  parse_post_list(post_list)
}


#' feed parser
#' @noRd
parse_feed <- function(res) {
  post_list <- purrr::map(res, "post", .default = list())
  parse_post_list(post_list)
}


#' standard date parser for the format used by the protocol
#' @noRd
parse_time <- function(x) {
  strptime(x, format = "%Y-%m-%dT%H:%M:%OSZ", tz = "UTC")
}


#' simple default parser
#' @noRd
parse_response <- function(x) {
  purrr::map(x, function(r) {
    purrr::list_flatten(r) |>
      tibble::as_tibble() |>
      janitor::clean_names()
  }) |>
    dplyr::bind_rows()
}
