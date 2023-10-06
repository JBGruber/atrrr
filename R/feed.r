#' A view of an actor's feed.
#'
#' @param actor user handle to retrieve feed for.
#' @inheritParams get_followers
#'
#' @returns a data frame (or nested list) of posts
#' @export
#'
#' @examples
#' feed <- get_author_feed("profmusgrave.bsky.social")
get_author_feed <- function(actor,
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
    cli::cli_progress_step("Parsing {length(res)} results.",
                           msg_done = "All done!")
    out <- parse_feed(res)
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
#' @inheritParams search_actor
#'
#' @returns a data frame (or nested list) of posts
#' @export
#'
#' @examples
#' \dontrun{
#' get_timeline()
#' get_timeline(algorithm = "reverse-chronological")
#' }
get_timeline <- function(algorithm = NULL,
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
    cli::cli_progress_step("Parsing {length(res)} results.",
                           msg_done = "All done!")
    out <- parse_feed(res)
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
#' @inheritParams search_actor
#'
#' @returns list of the URI and CID of the post (invisible)
#' @export
#'
#' @examples
#' \dontrun{
#' post("Hello from #rstats with {atr}")
#' }
post <- function(text,
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

  if (!is.null(image)) {
    image_alt <- image_alt  %||% ""
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


#' lexicon seems wrong. translated from https://atproto.com/blog/create-post#images-embeds
com_atproto_repo_upload_blob2 <- function(image,
                                          .token = NULL) {

  .token <- .token %||% get_token()
  img <- magick::image_read(image)
  image_mimetype <- paste0("image/", tolower(magick::image_info(img)$format))

  # not sure how to get the magick image as raw vector
  img <- readBin(image, "raw", file.info(image)$size)

  httr2::request("https://bsky.social/xrpc/com.atproto.repo.uploadBlob") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_headers("Content-Type" = image_mimetype) |>
    httr2::req_body_raw(img) |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
