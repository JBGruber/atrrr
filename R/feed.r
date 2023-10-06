#' A view of an actor's feed.
#'
#' @param actor user handle to retrieve feed for.
#' @inheritParams get_followers
#'
#' @returns a data frame (or nested list) of posts
#' @export
#'
#' @examples
#' feed <- get_skeets_authored_by("profmusgrave.bsky.social")
get_skeets_authored_by <- function(actor,
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
      what = app_bsky_feed_get_author_feed,
      args = list(
        actor = actor,
        limit = req_limit,
        cursor = last_cursor,
        .token = NULL,
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
    out <- parse_feed(res)
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
    cli::cli_progress_update(force = TRUE)
  }

  cli::cli_progress_done()

  if (parse) {
    cli::cli_progress_step("Parsing {length(res)} results.")
    out <- parse_feed(res)
    cli::cli_process_done(msg_done = "Got {nrow(out)} results. All done!")
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
                      .token = NULL) {

  uri <- convert_http_to_at(post_url, .token = .token)

  res <- list()
  req_limit <- ifelse(limit > 100, 100, limit)
  last_cursor <- NULL

  cli::cli_progress_bar(
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
    cli::cli_progress_update(force = TRUE)
  }

  cli::cli_progress_done()

  if (parse) {
    cli::cli_progress_step("Parsing {length(res)} results.")

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

    cli::cli_process_done(msg_done = "Got {nrow(out)} results. All done!")
  } else {
    out <- res
  }
  attr(out, "last_cursor") <- last_cursor
  return(out)
}


#' @rdname get_likes
get_reposts <- function(post_url,
                      limit = 25L,
                      cursor = NULL,
                      parse = TRUE,
                      .token = NULL) {

  uri <- convert_http_to_at(post_url, .token = .token)

  res <- list()
  req_limit <- ifelse(limit > 100, 100, limit)
  last_cursor <- NULL

  cli::cli_progress_bar(
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
    cli::cli_progress_update(force = TRUE)
  }

  cli::cli_progress_done()

  if (parse) {
    cli::cli_progress_step("Parsing {length(res)} results.")

    out <- purrr::map(res, function(l) {
      purrr::list_flatten(l) |>
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
                           .token = NULL) {

  uri <- convert_http_to_at(feed_url, .token = .token)

  res <- list()
  req_limit <- ifelse(limit > 100, 100, limit)
  last_cursor <- NULL

  cli::cli_progress_bar(
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
    cli::cli_progress_update(force = TRUE)
  }

  cli::cli_progress_done()

  if (parse) {
    cli::cli_progress_step("Parsing {length(res)} results.")

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
    cli::cli_process_done(msg_done = "Got {nrow(out)} results. All done!")
  } else {
    out <- res
  }
  attr(out, "last_cursor") <- last_cursor
  return(out)
}


#' Post a skeet
#'
#' @param text Text to post
#' @param image path to an image to post
#' @param image_alt alt text for the image
#' @param created_at time stamp of the post
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
                 image = NULL,
                 image_alt = NULL,
                 created_at = Sys.time(),
                 .token = NULL) {

  cli::cli_progress_step(
    msg = "Request to post {.emph {text}}",
    msg_done = "Posted {.emph {text}}",
    msg_failed = "Something went wrong"
  )

  repo <- "atpr.bsky.social"
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

    thread <- app_bsky_feed_get_post_thread(in_reply_to, .token = .token)
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

  if (!is.null(image)) {
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

  invisible(com_atproto_repo_create_record(repo, collection, record, .token = .token))
}


#' @rdname post
post_skeet <- post


#' lexicon seems wrong. translated from https://atproto.com/blog/create-post#images-embeds
com_atproto_repo_upload_blob2 <- function(image,
                                          .token = NULL) {

  .token <- .token %||% get_token()
  img <- magick::image_read(image)
  image_mimetype <- paste0("image/", tolower(magick::image_info(img)$format))

  # TODO: not sure how to get the magick image as raw vector
  img <- readBin(image, "raw", file.info(image)$size)

  httr2::request("https://bsky.social/xrpc/com.atproto.repo.uploadBlob") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_headers("Content-Type" = image_mimetype) |>
    httr2::req_body_raw(img) |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}



#' Delete post
#'
#' @param post_url URL of post to delete
#' @inheritParams post
#'
#' @returns Nothing. Called to delete a post.
#' @export
delete_skeet <- function(post_url,
                         .token = NULL) {

  cli::cli_progress_step(
    msg = "Request to delete post {.emph {text}}",
    msg_done = "Posted {.emph {text}}",
    msg_failed = "Something went wrong"
  )

  post_info <- parse_at_uri(convert_http_to_at(post_url))

  invisible(do.call(
    what = com_atproto_repo_delete_record,
    args = list(
      repo = post_info$repo,
      collection = post_info$collection,
      rkey = post_info$rkey,
      .token = .token,
      .return = "json"
    )))

}


delete_post <- delete_skeet
