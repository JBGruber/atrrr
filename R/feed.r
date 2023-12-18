#' A view of an actor's skeets.
#'
#' @param actor user handle to retrieve feed for.
#' @inheritParams get_followers
#'
#' @returns a data frame (or nested list) of posts
#' @export
#'
#' @examples
#' \dontrun{
#' feed <- get_skeets_authored_by("profmusgrave.bsky.social")
#' }
get_skeets_authored_by <- function(actor,
                                   limit = 25L,
                                   cursor = NULL,
                                   parse = TRUE,
                                   verbose = NULL,
                                   .token = NULL) {

  res <- list()
  req_limit <- ifelse(limit > 100, 100, limit)
  last_cursor <- NULL

  if (verbosity(verbose)) cli::cli_progress_bar(
    format = "{cli::pb_spin} Got {length(res)} skeets, but there is more.. [{cli::pb_elapsed}]",
    format_done = "Got {length(res)} records. All done! [{cli::pb_elapsed}]"
  )

  while (length(res) < limit) {
    resp <- do.call(
      what = app_bsky_feed_get_author_feed,
      args = list(
        actor = actor,
        limit = req_limit,
        cursor = last_cursor,
        .token = .token,
        .return = "json"
      ))

    last_cursor <- resp$cursor
    res <- c(res, resp$feed)

    if (is.null(resp$cursor)) break
    if (verbosity(verbose)) cli::cli_progress_update(force = TRUE)
  }

  if (verbosity(verbose)) cli::cli_progress_done()

  if (parse) {
    if (verbosity(verbose)) cli::cli_progress_step("Parsing {length(res)} results.")
    out <- parse_feed(res)
    out$is_reskeet <- purrr::map_lgl(out$author, function(a) a$handle != actor)
    if (verbosity(verbose)) cli::cli_process_done(msg_done = "Got {nrow(out)} results. All done!")
  } else {
    out <- res
  }

  attr(out, "last_cursor") <- last_cursor
  return(out)
}

#' A view of the feed created by an actor.
#'
#' @param actor user handle to retrieve feed from
#' @inheritParams get_followers
#'
#' @returns a data frame (or nested list) of feeds
#' @export
#'
#' @examples
#' \dontrun{
#' feed <- get_feeds_created_by("profmusgrave.bsky.social")
#' }
get_feeds_created_by <- function(actor,
                                 limit = 25L,
                                 cursor = NULL,
                                 parse = TRUE,
                                 verbose = NULL,
                                 .token = NULL) {

  res <- list()
  req_limit <- ifelse(limit > 100, 100, limit)
  last_cursor <- NULL

  if (verbosity(verbose)) cli::cli_progress_bar(
    format = "{cli::pb_spin} Got {length(res)} feeds, but there is more.. [{cli::pb_elapsed}]",
    format_done = "Got {length(res)} records. All done! [{cli::pb_elapsed}]"
  )

  while (length(res) < limit) {
    resp <- do.call(
      what = app_bsky_feed_get_actor_feeds,
      args = list(
        actor = actor,
        limit = req_limit,
        cursor = last_cursor,
        .token = .token,
        .return = "json"
      ))

    last_cursor <- resp$cursor
    res <- c(res, resp$feed)

    if (is.null(resp$cursor)) break
    if (verbosity(verbose)) cli::cli_progress_update(force = TRUE)
  }

  if (verbosity(verbose)) cli::cli_progress_done()

  if (parse) {
    if (verbosity(verbose)) cli::cli_progress_step("Parsing {length(res)} results.")

    out <- res |>
      purrr::map_dfr(~{
        l <- .x |>
          purrr::list_flatten() |>
          purrr::list_flatten() |>
          purrr::compact()

        if(!is.null(l[["created_at"]])) l$created_at = parse_time(l$createdAt)
        if(!is.null(l[["indexedAt"]])) l$created_at = parse_time(l$indexedAt)

        return(as_tibble(l))

      })

    if (verbosity(verbose)) cli::cli_process_done(msg_done = "Got {nrow(out)} results. All done!")
  } else {
    out <- res
  }

  attr(out, "last_cursor") <- last_cursor
  return(out)
}

#' Get the skeets from a specific feed
#'
#' Get the skeets that would be shown when you open the given feed
#'
#' @param feed_url The url of the requested feed
#' @inheritParams search_user
#'
#' @returns a data frame (or nested list) of posts
#' @export
#'
#' @examples
#' \dontrun{
#' get_own_timeline()
#' get_own_timeline(algorithm = "reverse-chronological")
#' }
get_feed <- function(feed_url,
                     limit = 25L,
                     cursor = NULL,
                     parse = TRUE,
                     verbose = NULL,
                     .token = NULL) {

  res <- list()
  req_limit <- ifelse(limit > 100, 100, limit)
  last_cursor <- NULL

  if (verbosity(verbose)) cli::cli_progress_bar(
    format = "{cli::pb_spin} Got {length(res)} skeets, but there is more.. [{cli::pb_elapsed}]",
    format_done = "Got {length(res)} records. All done! [{cli::pb_elapsed}]"
  )

  while (length(res) < limit) {
    resp <- do.call(
      what = app_bsky_feed_get_feed,
      args = list(
        feed = feed_url,
        limit = req_limit,
        cursor = last_cursor,
        .token = .token,
        .return = "json"
      ))

    last_cursor <- resp$cursor
    res <- c(res, resp$feed)

    if (is.null(resp$cursor)) break
    if (verbosity(verbose)) cli::cli_progress_update(force = TRUE)
  }

  if (verbosity(verbose)) cli::cli_progress_done()

  if (parse) {
    if (verbosity(verbose)) cli::cli_progress_step("Parsing {length(res)} results.")
    out <- parse_feed(res)
    if (verbosity(verbose)) cli::cli_process_done(msg_done = "Got {nrow(out)} results. All done!")
  } else {
    out <- res
  }
  attr(out, "last_cursor") <- last_cursor
  return(out)
}

#' Search a specific feed
#'
#' Search the feed named after a given query
#'
#' @param query The term to be searched
#' @inheritParams search_user
#'
#' @returns a data frame (or nested list) of posts
#' @export
#'
#' @examples
#' \dontrun{
#' search_feed("rstats")
#' }
search_feed <- function(query,
                        limit = 25L,
                        cursor = NULL,
                        parse = TRUE,
                        .token = NULL) {

  res <- list()
  req_limit <- ifelse(limit > 100, 100, limit)
  last_cursor <- NULL

  cli::cli_progress_bar(
    format = "{cli::pb_spin} Got {length(res)} skeets, but there is more.. [{cli::pb_elapsed}]",
    format_done = "Got {length(res)} records. All done! [{cli::pb_elapsed}]"
  )

  while (length(res) < limit) {
    resp <- do.call(
      what = app_bsky_unspecced_get_popular_feed_generators,
      args = list(
        query = query,
        limit = req_limit,
        cursor = last_cursor,
        .token = .token,
        .return = "json"
      ))

    last_cursor <- resp$cursor
    res <- c(res, resp$feed)

    if (is.null(resp$cursor)) break
    cli::cli_progress_update(force = TRUE)
  }

  cli::cli_progress_done()

  if (parse) {
    cli::cli_progress_step("Parsing {length(res)} results.")
    out <- res |>
      purrr::map_dfr(~{
        .x |>
          purrr::list_flatten() |>
          purrr::list_flatten() |>
          purrr::compact() |>
          tibble::as_tibble()
      }) |>
      dplyr::bind_rows()
    cli::cli_process_done(msg_done = "Got {nrow(out)} results. All done!")
  } else {
    out <- res
  }
  attr(out, "last_cursor") <- last_cursor
  return(out)
}


#' Get your own timeline
#'
#' Get the posts that would be shown when you open the Bluesky app or website.
#'
#' @param algorithm algorithm used to sort the posts
#' @inheritParams search_user
#'
#' @returns a data frame (or nested list) of posts
#' @export
#'
#' @examples
#' \dontrun{
#' get_own_timeline()
#' get_own_timeline(algorithm = "reverse-chronological")
#' }
get_own_timeline <- function(algorithm = NULL,
                             limit = 25L,
                             cursor = NULL,
                             parse = TRUE,
                             verbose = NULL,
                             .token = NULL) {

  res <- list()
  req_limit <- ifelse(limit > 100, 100, limit)
  last_cursor <- NULL

  if (verbosity(verbose)) cli::cli_progress_bar(
    format = "{cli::pb_spin} Got {length(res)} skeets, but there is more.. [{cli::pb_elapsed}]",
    format_done = "Got {length(res)} records. All done! [{cli::pb_elapsed}]"
  )

  while (length(res) < limit) {
    resp <- do.call(
      what = app_bsky_feed_get_timeline,
      args = list(
        algorithm = algorithm,
        limit = req_limit,
        cursor = last_cursor,
        .token = .token,
        .return = "json"
      ))

    last_cursor <- resp$cursor
    res <- c(res, resp$feed)

    if (is.null(resp$cursor)) break
    if (verbosity(verbose)) cli::cli_progress_update(force = TRUE)
  }

  if (verbosity(verbose)) cli::cli_progress_done()

  if (parse) {
    if (verbosity(verbose)) cli::cli_progress_step("Parsing {length(res)} results.")
    out <-  res |>
      purrr::map_dfr(~{
        .x |>
          purrr::list_flatten() |>
          purrr::list_flatten() |>
          purrr::compact() |>
          tibble::as_tibble()
      }) |>
      dplyr::bind_rows()
    if (verbosity(verbose)) cli::cli_process_done(msg_done = "Got {nrow(out)} results. All done!")
  } else {
    out <- res
  }
  attr(out, "last_cursor") <- last_cursor
  return(out)
}


#' Get likes/reposts of a skeet
#'
#' @param post_url the URL of a skeet for which to retrieve who liked/reposted it.
#' @inheritParams search_user
#'
#' @returns a data frame (or nested list) of likes/reposts
#' @export
get_likes <- function(post_url,
                      limit = 25L,
                      cursor = NULL,
                      parse = TRUE,
                      verbose = NULL,
                      .token = NULL) {

  uri <- convert_http_to_at(post_url, .token = .token)

  res <- list()
  req_limit <- ifelse(limit > 100, 100, limit)
  last_cursor <- NULL

  if (verbosity(verbose)) cli::cli_progress_bar(
    format = "{cli::pb_spin} Got {length(res)} like entries, but there is more.. [{cli::pb_elapsed}]",
    format_done = "Got {length(res)} records. All done! [{cli::pb_elapsed}]"
  )

  while (length(res) < limit) {
    resp <- do.call(
      what = app_bsky_feed_get_likes,
      args = list(
        uri = uri,
        cid = NULL,
        limit = req_limit,
        cursor = last_cursor,
        .token = .token,
        .return = "json"
      ))

    last_cursor <- resp$cursor
    res <- c(res, resp$likes)

    if (is.null(resp$cursor)) break
    if (verbosity(verbose)) cli::cli_progress_update(force = TRUE)
  }

  if (verbosity(verbose)) cli::cli_progress_done()

  if (parse) {
    if (verbosity(verbose)) cli::cli_progress_step("Parsing {length(res)} results.")

    out <- purrr::map(res, function(l) {
      tibble::tibble(
        created_at = parse_time(l$createdAt),
        indexed_at = parse_time(l$indexedAt),
        actor_handle = l$actor$handle,
        actor_name = l$actor$displayName,
        actor_data = list(l$actor)
      )
    }) |>
      dplyr::bind_rows()

    if (verbosity(verbose)) cli::cli_process_done(msg_done = "Got {nrow(out)} results. All done!")
  } else {
    out <- res
  }
  attr(out, "last_cursor") <- last_cursor
  return(out)
}


#' @rdname get_likes
#' @export
get_reposts <- function(post_url,
                        limit = 25L,
                        cursor = NULL,
                        parse = TRUE,
                        verbose = NULL,
                        .token = NULL) {

  uri <- convert_http_to_at(post_url, .token = .token)

  res <- list()
  req_limit <- ifelse(limit > 100, 100, limit)
  last_cursor <- NULL

  if (verbosity(verbose)) cli::cli_progress_bar(
    format = "{cli::pb_spin} Got {length(res)} reposts, but there is more.. [{cli::pb_elapsed}]",
    format_done = "Got {length(res)} reposts. All done! [{cli::pb_elapsed}]"
  )

  while (length(res) < limit) {
    resp <- do.call(
      what = app_bsky_feed_get_reposted_by,
      args = list(
        uri = uri,
        cid = NULL,
        limit = req_limit,
        cursor = last_cursor,
        .token = .token,
        .return = "json"
      ))

    last_cursor <- resp$cursor
    res <- c(res, resp$repostedBy)

    if (is.null(resp$cursor)) break
    if (verbosity(verbose)) cli::cli_progress_update(force = TRUE)
  }

  if (verbosity(verbose)) cli::cli_progress_done()

  if (parse) {
    if (verbosity(verbose)) cli::cli_progress_step("Parsing {length(res)} results.")

    out <- purrr::map(res, function(l) {
      purrr::list_flatten(l) |>
        tibble::as_tibble()
    }) |>
      dplyr::bind_rows()

    if (verbosity(verbose)) cli::cli_process_done(msg_done = "Got {nrow(out)} results. All done!")

  } else {
    out <- res
  }
  attr(out, "last_cursor") <- last_cursor
  return(out)
}


#' Get likes of a feed
#'
#' @param feed_url the URL of a feed for which to retrieve who liked it.
#' @inheritParams search_user
#'
#' @returns a data frame (or nested list) of likes/reposts
#' @export
get_feed_likes <- function(feed_url,
                           limit = 25L,
                           cursor = NULL,
                           parse = TRUE,
                           verbose = NULL,
                           .token = NULL) {

  uri <- convert_http_to_at(feed_url, .token = .token)

  res <- list()
  req_limit <- ifelse(limit > 100, 100, limit)
  last_cursor <- NULL

  if (verbosity(verbose)) cli::cli_progress_bar(
    format = "{cli::pb_spin} Got {length(res)} like entries, but there is more.. [{cli::pb_elapsed}]",
    format_done = "Got {length(res)} records. All done! [{cli::pb_elapsed}]"
  )

  while (length(res) < limit) {
    resp <- do.call(
      what = app_bsky_feed_get_likes,
      args = list(
        uri = uri,
        cid = NULL,
        limit = req_limit,
        cursor = last_cursor,
        .token = .token,
        .return = "json"
      ))

    last_cursor <- resp$cursor
    res <- c(res, resp$likes)

    if (is.null(resp$cursor)) break
    if (verbosity(verbose)) cli::cli_progress_update(force = TRUE)
  }

  if (verbosity(verbose)) cli::cli_progress_done()

  if (parse) {
    if (verbosity(verbose)) cli::cli_progress_step("Parsing {length(res)} results.")

    out <- purrr::map(res, function(l) {
      tibble::tibble(
        created_at = parse_time(l$createdAt),
        indexed_at = parse_time(l$indexedAt),
        actor_handle = l$actor$handle,
        actor_name = l$actor$displayName,
        actor_data = list(l$actor)
      )
    }) |>
      dplyr::bind_rows()
    if (verbosity(verbose)) cli::cli_process_done(msg_done = "Got {nrow(out)} results. All done!")
  } else {
    out <- res
  }
  attr(out, "last_cursor") <- last_cursor
  return(out)
}


#' Get all skeets in a thread
#'
#' Retrieve all skeets in a thread (all replies to an original skeet by any
#' author). It does not matter if you use the original skeet or any reply as
#' \code{post_url}.
#'
#' @param post_url the URL of any skeet in a thread.
#' @inheritParams search_user
#'
#' @returns a data frame of skeets
#' @export
get_thread <- function(post_url,
                       .token = NULL) {

  post_uri <- convert_http_to_at(post_url)
  root <- do.call(app_bsky_feed_get_post_thread, list(post_uri, .token = .token)) |>
    get_thread_root()
  thread <- do.call(app_bsky_feed_get_post_thread,
                    list(purrr::pluck(root, "post", "uri"), .token = .token))

  return(parse_threads(thread))

}


#' Get all replies
#'
#' Get all replies and replies on replies of a skeet.
#'
#' @param post_url the URL of a skeet.
#' @inheritParams search_user
#'
#' @returns a data frame of skeets
#' @export
get_replies <- function(post_url,
                        .token = NULL) {

  post_uri <- convert_http_to_at(post_url)
  replies <- do.call(app_bsky_feed_get_post_thread, list(post_uri, .token = .token))
  return(parse_threads(replies))

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


#' Post a skeet
#'
#' @param text Text to post
#' @param in_reply_to URL or URI of a skeet this should reply to.
#' @param quote URL or URI of a skeet this should quote.
#' @param image path to an image to post
#' @param image_alt alt text for the image
#' @param created_at time stamp of the post
#' @param post_url URL or URI of post to delete
#' @inheritParams search_user
#'
#' @returns list of the URI and CID of the post (invisible)
#' @export
#'
#' @examples
#' \dontrun{
#' post("Hello from #rstats with {atr}")
#' }
post <- function(text,
                 in_reply_to = NULL,
                 quote = NULL,
                 image = NULL,
                 image_alt = NULL,
                 created_at = Sys.time(),
                 verbose = NULL,
                 .token = NULL) {

  cli::cli_progress_step(
    msg = "Request to post {.emph {text}}",
    msg_done = "Posted {.emph {text}}",
    msg_failed = "Something went wrong"
  )

  repo <- get_token()[["handle"]]
  collection <- "app.bsky.feed.post"

  record <- list(
    "$type" = "app.bsky.feed.post",
    "text" = text,
    "createdAt" = format(as.POSIXct(created_at, tz = "UTC"), "%Y-%m-%dT%H:%M:%OS6Z")
  )

  if (!is.null(in_reply_to)) {
    in_reply_to <- ifelse(grepl("^http", in_reply_to),
                          convert_http_to_at(in_reply_to),
                          in_reply_to)

    thread <- do.call(app_bsky_feed_get_post_thread, list(in_reply_to, .token = .token))
    thread_root <- get_thread_root(thread)
    record[["reply"]] <- list(
      root = list(
        "uri" = thread_root$post$uri,
        "cid" = thread_root$post$cid
      ),
      parent = list(
        "uri" = thread$thread$post$uri,
        "cid" = thread$thread$post$cid
      )
    )
  }

  # quote <- "https://bsky.app/profile/favstats.bsky.social/post/3kc57mkoi6a2k"
  if (!is.null(quote)) {
    quote <- ifelse(grepl("^http", quote),
                    convert_http_to_at(quote),
                    quote)

    quote_post <- do.call(app_bsky_feed_get_posts, list(quote, .token = .token))


    # thread <- do.call(app_bsky_feed_get_post_thread, list(quote, .token = .token))
    # thread_root <- get_thread_root(thread)
    record[["embed"]] <- list(
      "$type" = "app.bsky.embed.record",
      "record" = list(
        "uri" = quote_post$posts[[1]]$uri,
        "cid" = quote_post$posts[[1]]$cid
      )
    )
  }

  if (!is.null(image) && image != "") {
    rlang::check_installed("magick")
    image_alt <- image_alt  %||% ""
    # TODO: make it possible to post several images (up to 4 are allowed)
    blob <- com_atproto_repo_upload_blob2(image, .token = .token)
    record[["embed"]] <- list(
      "$type" = "app.bsky.embed.images",
      images = list(
        list(alt = image_alt,
             image = blob[["blob"]]))
    )
  }

  # https://atproto.com/blog/create-post#mentions-and-links
  parsed_richtext <- parse_facets(text)
  if (!any(is.na(unlist(parsed_richtext)))) {
    record[["facets"]] <- parsed_richtext
  }

  invisible(do.call(what = com_atproto_repo_create_record,
                    args = list(repo, collection, record, .token = .token)))

}

# app_bsky_feed_get_posts()

#' @rdname post
#' @export
post_skeet <- post



#' @rdname post
#' @export
delete_skeet <- function(post_url,
                         verbose = NULL,
                         .token = NULL) {

  id <- basename(post_url)
  if (verbosity(verbose)) cli::cli_progress_step(
    msg = "Request to delete post {.emph {id}}",
    msg_done = "Deleted {.emph {id}}",
    msg_failed = "Something went wrong"
  )

  invisible(purrr::map(post_url, function(u) {
    post_info <- ifelse(grepl("^http", u),
                        convert_http_to_at(u),
                        u) |>
      parse_at_uri()

    do.call(
      what = com_atproto_repo_delete_record,
      args = list(
        repo = post_info$repo,
        collection = post_info$collection,
        rkey = post_info$rkey,
        .token = .token,
        .return = "json"
      ))
  }))

}


#' @rdname post
#' @export
delete_post <- delete_skeet


#' Post a thread
#'
#' @param texts a vector of skeet (post) texts
#' @param images paths to images to be included in each post
#' @param image_alts alt texts for the images to be included in each post
#' @param thread_df instead of defining texts, images and image_alts, you can
#'   also create a data frame with the information in columns of the same names.
#' @inheritParams search_user
#'
#' @return list of the URIs and CIDs of the posts (invisible)
#' @export
#'
#' @examples
#' \dontrun{
#' # post three messages in a thread
#' thread <- post_thread(c("Post 1", "Post 2", "Post 3"))
#'
#' # delete the thread
#' delete_post(thread$uri)
#' }
post_thread <- function(texts,
                        images = NULL,
                        image_alts = NULL,
                        thread_df = NULL,
                        verbose = NULL,
                        .token = NULL) {

  if (is.null(thread_df)) {
    images <- images  %||% rep("", length(texts))
    image_alts <- image_alts  %||% rep("", length(texts))
    if (length(unique(lengths(list(texts, images, image_alts)))) != 1L) {
      cli::cli_abort("texts, images, image_alts must all have the same length or be NULL.")
    }

    thread_df <- data.frame(
      text = texts,
      image = images,
      image_alt = image_alts
    )
  }

  ref <- NULL
  refs <- list()

  for (i in seq_along(thread_df$text)) {
    ref <- do.call(
      what = post_skeet,
      args = list(text = thread_df$text[i],
                  image = thread_df$image[i],
                  image_alt = thread_df$image_alt[i],
                  in_reply_to = ref)
    )
    refs <- c(refs, list(ref))
    ref <- ref$uri
  }
  return(dplyr::bind_rows(refs))
}


#' Search Posts
#'
#' @param q Find posts matching search criteria. API docs claim that Lucene
#'   query syntax is supported (boolean operators and brackets for complex
#'   queries). But only whitespace as implicit AN seems to work.
#' @inheritParams search_user
#'
#' @returns a data frame (or nested list) of posts
#'
#' @examples
#' \dontrun{
#' search_post("rstats")
#' # finds post with rstats and Bluesky in text
#' search_post("rstats Bluesky")
#' # does not find anything, since hashtags seem to be treated differently
#' search_post("#rstats")
#' }
#' @export
search_post <- function(q,
                        limit = 100L,
                        parse = TRUE,
                        verbose = NULL,
                        .token = NULL) {

  res <- list()
  req_limit <- ifelse(limit > 100, 100, limit)
  last_cursor <- NULL

  if (stringr::str_detect(q, "^#")) {
    q <- stringr::str_remove(q, "^#")
    cli::cli_alert_info("The search endpoint currently does not support searching for hashtags. Searching for \"{q}\" instead")
  }

  if (verbosity(verbose)) cli::cli_progress_bar(
    format = "{cli::pb_spin} Got {length(res)} posts, but there is more.. [{cli::pb_elapsed}]",
    format_done = "Retrieved {length(res)} posts from {resp$hitsTotal} total hits. All done! [{cli::pb_elapsed}]"
  )

  while (length(res) < limit) {
    resp <- do.call(
      what = app_bsky_feed_search_posts,
      args = list(
        q = q,
        limit = req_limit,
        cursor = last_cursor,
        .token = .token,
        .return = "json"
      ))

    if (is.null(resp$hitsTotal))
      resp$hitsTotal <- "an *unknown total* of"
    if (is.null(last_cursor) && verbosity(verbose))
      cli::cli_alert_info("Found {resp$hitsTotal} posts that fit the query")

    last_cursor <- resp$cursor
    res <- c(res, resp$posts)

    if (is.null(resp$cursor)) break
    if (verbosity(verbose)) cli::cli_progress_update(force = TRUE)
  }

  if (verbosity(verbose)) cli::cli_progress_done()

  if (parse) {
    if (verbosity(verbose)) cli::cli_progress_step("Parsing {length(res)} results.")

    out <- purrr::map(res, function(l) {
      tibble::tibble(
        uri = l$uri,
        cid = l$cid,
        created_at = parse_time(l$record$createdAt),
        author_handle = l$author$handle,
        author_name = l$author$displayName,
        text = l$record$text,
        reply_count = l$replyCount,
        repost_count = l$repostCount,
        like_count = l$likeCount,
        indexed_at = parse_time(l$indexedAt),
        author_data = list(l$author),
        post_data = list(l$record),
        embed_data = list(l$embed),
        # TODO: return URL instead of URI
        in_reply_to = l$record$reply$parent$uri,
        in_reply_root = l$record$reply$root$uri,
        quotes = l$record$embed$record$uri
      )
    }) |>
      dplyr::bind_rows()

    if (verbosity(verbose)) cli::cli_process_done(msg_done = "Got {nrow(out)} results. All done!")
  } else {
    out <- res
  }
  attr(out, "last_cursor") <- last_cursor
  return(out)
}

