# parse threads into a data.frame
parse_threads <- function(thread) {

  post_list <- list(purrr::pluck(thread, "thread", "post"))

  replies <- purrr::pluck(thread, "thread", "replies")

  while (length(replies) > 0) {
    post_list <- c(post_list, purrr::map(replies, "post"))
    replies <- purrr::map(replies, "replies") |>
      purrr::flatten()
  }

  tibble::tibble(
    uri           = purrr::map_chr(post_list, "uri"),
    cid           = purrr::map_chr(post_list, "cid"),
    author_handle = purrr::map_chr(post_list, c("author", "handle")),
    author_name   = purrr::map_chr(post_list, c("author", "displayName")),
    text          = purrr::map_chr(post_list, c("record", "text")),
    author_data   = purrr::map(post_list, "author"),
    record_data   = purrr::map(post_list, "record"),
    embed_data    = purrr::map(post_list, "embed"),
    replyCount    = purrr::map_int(post_list, "replyCount"),
    repostCount   = purrr::map_int(post_list, "repostCount"),
    likeCount     = purrr::map_int(post_list, "likeCount"),
    indexedAt     = parse_time(purrr::map_chr(post_list, "indexedAt")),
    viewer_data   = purrr::map(post_list, "viewer"),
    labels_data   = purrr::map(post_list, "labels"),
    # TODO: return URL instead of URI
    in_reply_to   = purrr::map_chr(post_list, c("record", "reply", "parent", "uri"), .default = NA_character_),
    in_reply_root = purrr::map_chr(post_list, c("record", "reply", "root", "uri"), .default = NA_character_),
  )
}
