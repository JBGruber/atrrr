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
#' feed <- get_skeets_authored_by("andrew.heiss.phd")
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
    out$is_reskeet <- out$author_handle != actor
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
#' feed <- get_feeds_created_by("andrew.heiss.phd")
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

    out <- parse_feeds_list(res)

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
#' # use the URL of a feed
#' get_feed("https://bsky.app/profile/did:plc:2zcfjzyocp6kapg6jc4eacok/feed/aaaeckvqc3gzg")
#'
#' # or search for a feed by name
#' res <- search_feed("#rstats")
#' get_feed(res$uri[1])
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

  feed_url <- convert_http_to_at(feed_url, .token = .token)

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
    if (verbosity(verbose)) cli::cli_progress_update(force = TRUE)
  }

  if (verbosity(verbose)) cli::cli_progress_done()

  if (parse) {
    if (verbosity(verbose)) cli::cli_progress_step("Parsing {length(res)} results.")
    out <- parse_feeds_list(res)
    if (verbosity(verbose)) cli::cli_process_done(msg_done = "Got {nrow(out)} results. All done!")
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
    out <- parse_timeline(res)
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
#'
#' @export
#'
#' @examples
#' \dontrun{
#' get_likes("https://bsky.app/profile/jbgruber.bsky.social/post/3kbi55xm6u62v")
#' get_reposts("https://bsky.app/profile/jbgruber.bsky.social/post/3kbi55xm6u62v")
#' }
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

    out <- parse_likes(res)

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

    out <- parse_actors(res)

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
#'
#' @examples
#' \dontrun{
#' # use the URL of a feed
#' get_feed_likes("https://bsky.app/profile/did:plc:2zcfjzyocp6kapg6jc4eacok/feed/aaaeckvqc3gzg")
#'
#' # or search for a feed by name
#' res <- search_feed("#rstats")
#' get_feed_likes(res$uri[1])
#' }
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
    out <- parse_likes(res)
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
#'
#' @examples
#' \dontrun{
#' get_thread("https://bsky.app/profile/jbgruber.bsky.social/post/3kbi57u4sys2l")
#' }
get_thread <- function(post_url,
                       .token = NULL) {

  post_uri <- convert_http_to_at(post_url, .token = .token)
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
#'
#' @examples
#' \dontrun{
#' get_replies("https://bsky.app/profile/jbgruber.bsky.social/post/3kbi57u4sys2l")
#' }
get_replies <- function(post_url,
                        .token = NULL) {

  post_uri <- convert_http_to_at(post_url, .token = .token)
  replies <- do.call(app_bsky_feed_get_post_thread, list(post_uri, .token = .token))
  return(parse_threads(replies))

}


#' Post a skeet
#'
#' @param text Text to post
#' @param in_reply_to URL or URI of a skeet this should reply to.
#' @param quote URL or URI of a skeet this should quote.
#' @param image path to an image to post.
#' @param image_alt alt text for the image.
#' @param created_at time stamp of the post.
#' @param labels can be used to label a post, for example "!no-unauthenticated",
#'   "porn", "sexual", "nudity", or "graphic-media".
#' @param langs indicates human language(s) (up to 3) of post's primary text
#'   content.
#' @param tags additional hashtags, in addition to any included in post text and
#'   facets.
#' @param preview_card display a preview card for links included in the text
#'   (only if image is `NULL`).
#' @param post_url URL or URI of post to delete.
#' @inheritParams search_user
#'
#' @returns list of the URI and CID of the post (invisible)
#' @export
#'
#' @examples
#' \dontrun{
#' post("Hello from #rstats with {atrrr}")
#' }
post <- function(text,
                 in_reply_to = NULL,
                 quote = NULL,
                 image = NULL,
                 image_alt = NULL,
                 created_at = Sys.time(),
                 labels = NULL,
                 langs = NULL,
                 tags = NULL,
                 preview_card = TRUE,
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
    "createdAt" = format(as.POSIXct(created_at, tz = "UTC"), "%Y-%m-%dT%H:%M:%OS6Z"),
    langs = as.list(langs),
    tags = as.list(tags)
  )

  record$labels <- list(
    "$type" = "com.atproto.label.defs#selfLabels",
    values = lapply(labels, function(l)
      list("$type" = "com.atproto.label.defs#selfLabel", val = l))
  )

  if (!is.null(in_reply_to)) {
    in_reply_to <- ifelse(grepl("^http", in_reply_to),
                          convert_http_to_at(in_reply_to, .token = .token),
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
                    convert_http_to_at(quote, .token = .token),
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

  if (!is.null(image) && !identical(image, "")) {
    image <- from_ggplot(image)
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
    if (!purrr::pluck_exists(record, "embed") && preview_card) {
      # preview card
      record <- fetch_preview(record)
    }
  }

  invisible(do.call(what = com_atproto_repo_create_record,
                    args = list(repo, collection, record, .token = .token)))

}


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
                        convert_http_to_at(u, .token = .token),
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
  refs <- data.frame()

  for (i in seq_along(thread_df$text)) {
    ref <- do.call(
      what = post_skeet,
      args = list(text = thread_df$text[i],
                  image = thread_df$image[i],
                  image_alt = thread_df$image_alt[i],
                  in_reply_to = ref)
    )
    refs <- rbind(refs, as.data.frame(ref))
    ref <- ref$uri
  }
  return(refs)
}


#' Search Posts
#'
#' @param q search query. See Details.
#' @inheritParams search_user
#'
#' @details The [API
#'   docs](https://docs.bsky.app/docs/api/app-bsky-feed-search-posts) claim that
#'   Lucene query syntax is supported (Boolean operators and brackets for
#'   complex queries). But only a small subset is [actually
#'   implemented](https://github.com/bluesky-social/indigo/tree/main/cmd/palomar):
#'
#'   - Whitespace is treated as implicit AND, so all words in a query must occur,
#'      but the word order and proximity are ignored.
#'   - Double quotes indicate exact phrases.
#'   - `from:<handle>` will filter to results from that account.
#'   - `-` excludes terms (does not seem to be working at the moment).
#'
#'   Note that matches can occur anywhere in the skeet, not just the text. For
#'   example, a term can be in the link preview, or alt text of an image.
#'
#'
#' @returns a data frame (or nested list) of posts
#'
#' @examples
#' \dontrun{
#' search_post("rstats")
#' # finds post with the hashtag rstats AND the word Bluesky somewhere in the
#' # skeet (ignoring capitalisaion)
#' search_post("#rstats Bluesky")
#'
#' # search for the exact phrase "new #rstats package"
#' search_post("\"new #rstats package\"")
#' # Use single quotes so you do not need to escape double quotes
#' search_post('"new #rstats package"')
#'
#' # only search for skeets from one user
#' search_post("from:jbgruber.bsky.social #rstats")
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

    out <- parse_post_list(res)

    if (verbosity(verbose)) cli::cli_process_done(msg_done = "Got {nrow(out)} results. All done!")
  } else {
    out <- res
  }
  attr(out, "last_cursor") <- last_cursor
  return(out)
}

#' @rdname search_post
#' @export
search_skeet <- search_post
