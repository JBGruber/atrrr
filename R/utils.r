the <- new.env()

#' Download new lexicon and save it into the inst folder
#'
#' @param path relative path from repository
#'   <https://github.com/bluesky-social/atproto>.
#'
#' @return Nothing, downloads files into appropriate folder
#' @export
#'
#' @examples
#' get_lexicon("app/bsky/actor/getProfile.json")
get_lexicon <- function(path) {
  base_url <- "https://raw.githubusercontent.com/bluesky-social/atproto/main/lexicons/"
  d_url <- file.path(base_url, path)
  # TODO: check if inside_pkg() is neccesary
  if (inside_pkg()) {
    d <- file.path("inst/lexicons", dirname(path))
  } else {
    d <- file.path(system.file("lexicons", package = "atr"), dirname(path))
  }
  dir.create(d, showWarnings = FALSE, recursive = TRUE)
  curl::curl_download(d_url, file.path(d, basename(path)))
}


error_parse <- function(resp) {
  e <- httr2::resp_body_json(resp)
  c(
    glue::glue("error type: {e$error}"),
    glue::glue("message: {e$message}")
  )
}


inside_pkg <- function() {
  d <- basename(getwd()) == "atr"
  p <- 0
  if (d) p <- any(grepl("Package: atr", readLines("DESCRIPTION")))
  d + p == 2L
}
