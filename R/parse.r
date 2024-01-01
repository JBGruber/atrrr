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
    post_data     = purrr::map(post_list, "record"),
    embed_data    = purrr::map(post_list, "embed"),
    reply_count   = purrr::map_int(post_list, "replyCount",
                                   .default = NA_integer_),
    repost_count  = purrr::map_int(post_list, "repostCount",
                                   .default = NA_integer_),
    like_count    = purrr::map_int(post_list, "likeCount",
                                   .default = NA_integer_),
    indexed_at    = parse_time(purrr::map_chr(post_list, "indexedAt")),
    # TODO: return URL instead of URI
    in_reply_to   = purrr::map_chr(post_list, c("record", "reply", "parent", "uri"),
                                   .default = NA_character_),
    in_reply_root = purrr::map_chr(post_list, c("record", "reply", "root", "uri"),
                                   .default = NA_character_),
    quotes        = purrr::map_chr(post_list, c("record", "embed", "record", "uri"),
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


#' feeds list parser
#' @noRd
parse_feeds_list <- function(res) {
  rlang::check_installed("dplyr")
  purrr::map(res, ~ {
    l <- .x |>
      purrr::list_flatten() |>
      purrr::list_flatten() |>
      purrr::compact()

    if (!is.null(l[["created_at"]])) l$created_at <- parse_time(l$createdAt)
    if (!is.null(l[["indexedAt"]])) l$created_at <- parse_time(l$indexedAt)

    return(tibble::as_tibble(l))
  }) |>
    dplyr::bind_rows()
}


# Parse facets from text and resolve the handles to DIDs
parse_facets <- function(text) {

  facets <- list()
  mentions <- str_locate_all_bytes(text, regexs$mention_regex)
  mentions$match <- stringr::str_remove(mentions$match, "@")
  facets <- purrr::pmap(mentions, function(start, end, match) {

    did <- do.call(com_atproto_identity_resolve_handle, list(handle = match)) |>
      purrr::pluck("did")

    list(
      index = list(byteStart = start, byteEnd = end),
      features = list(list("$type" = "app.bsky.richtext.facet#mention", "did" = did))
    )

  }) |>
    append(facets)

  urls <- str_locate_all_bytes(text, regexs$url_regex)
  facets <- purrr::pmap(urls, function(start, end, match) {
    list(
      index = list(byteStart = start, byteEnd = end),
      features = list(list("$type" = "app.bsky.richtext.facet#link", "uri" = match))
    )
  }) |>
    append(facets)

  # # in theory, we could use an approach like this to support hashtags. The
  # # problem is that the linked search does not work. It simply ignores the #
  # hashtags <- str_locate_all_bytes(text, "\\W#\\w+")
  # hashtags$match <- stringr::str_remove(hashtags$match, "#")
  # facets <- purrr::pmap(hashtags, function(start, end, match) {
  #   list(
  #     index = list(byteStart = start, byteEnd = end),
  #     features = list(list(
  #       "$type" = "app.bsky.richtext.facet#link",
  #       "uri" = glue::glue("https://bsky.app/search?q=%23{match}")))
  #   )
  # }) |>
  #   append(facets)
  return(facets)
}


#' standard date parser for the format used by the protocol
#' @noRd
parse_time <- function(x) {
  strptime(x, format = "%Y-%m-%dT%H:%M:%OSZ", tz = "UTC")
}

clean_names <- function(str) {
  tolower(gsub("(.)([A-Z])([a-z]{2,})", "\\1_\\2\\3", make.names(str)))
}


#' simple default parser
#' @noRd
parse_response <- function(x) {
  rlang::check_installed("dplyr")
  purrr::map(x, function(r) {
    purrr::list_flatten(r) |>
      tibble::as_tibble(.name_repair = function(n)
        snakecase::to_snake_case(make.names(n)))
  }) |>
    dplyr::bind_rows()
}


parse_likes <- function(res) {
  tibble::tibble(
    created_at   = parse_time(purrr::map_chr(res, "createdAt")),
    indexed_at   = parse_time(purrr::map_chr(res, "indexedAt")),
    actor_handle = purrr::map_chr(res, c("actor", "handle")),
    actor_name   = purrr::map_chr(res, c("actor", "displayName"),
                                  .default = NA_character_),
    actor_data   = purrr::map(res, "actor",
                              .default = NA_character_)
  )
}

parse_actors <- function(res) {
  tibble::tibble(
    did               = purrr::map_chr(res, "did"),
    indexed_at        = parse_time(purrr::map_chr(res, "indexedAt",
                                                  .default = NA_character_)),
    actor_handle      = purrr::map_chr(res, "handle"),
    actor_name        = purrr::map_chr(res, "displayName",
                                       .default = NA_character_),
    actor_description = purrr::map_chr(res, "description",
                                       .default = NA_character_),
    actor_avatar      = purrr::map_chr(res, "avatar",
                                       .default = NA_character_),
    viewer_data       = purrr::map(res, "viewer",
                                   .default = NA_character_),
    labels_data       = purrr::map(res, "labels",
                                   .default = NA_character_)
  )
}

