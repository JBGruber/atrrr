#' List all files in github subfolders up to a certain depth
#'
#' @param repo target github repository
#' @param folder the subfolder that should be searched
#' @param max_depth the maximum depth taht should be explored
#'
#' @inheritParams search_user
#'
#' @return The list of corresponding paths. If the depth is reached, it returns
#'   the folder where max-depth was reached
#'
#' @examples
#' \dontrun{
#' github_ls(repo = "https://api.github.com/repos/bluesky-social/atproto/contents",
#'           folder = "lexicons")
#' }
#' @noRd
github_ls <- function(repo, folder, max_depth = 10, verbose = NULL) {
  paths <- glue::glue("{repo}/{folder}")

  files <- c()
  depth <- 1

  while (length(paths) > 0 && depth <= max_depth) {
    new_path <- c()
    for (path in paths) {
      if (verbosity(verbose)) cli::cli_progress_step("Crawl path {sub(repo, '', path, fixed = TRUE)}")
      rlang::check_installed("jsonlite")
      res <- jsonlite::read_json(path)
      new <- res |>
        purrr::keep(~ .x$type == "dir") |>
        purrr::map_chr("path")
      new_files <- res |>
        purrr::keep(~ .x$type != "dir") |>
        purrr::map_chr("path")
      files <- c(files, new_files)

      new_path <- c(new_path, glue::glue("{repo}/{new}"))
    }
    paths <- new_path
    depth <- depth + 1
  }
  if (verbosity(verbose)) cli::cli_progress_done()
  return(c(files, paths))
}

#' Download new lexicon and save it into the inst folder
#'
#' @param path relative path from repository
#'   <https://github.com/bluesky-social/atproto>.
#'
#' @return Nothing, downloads files into appropriate folder
#'
#' @examples
#' \dontrun{
#' get_lexicon("app/bsky/actor/getProfile.json")
#' }
#' @noRd
get_lexicon <- function(path) {
  base_url <- "https://raw.githubusercontent.com/bluesky-social/atproto/main/lexicons/"
  d_url <- file.path(base_url, path)
  # TODO: check if inside_pkg() is necessary
  if (inside_pkg()) {
    d <- file.path("inst/lexicons", dirname(path))
  } else {
    d <- file.path(system.file("lexicons", package = "atrrr"), dirname(path))
  }
  dir.create(d, showWarnings = FALSE, recursive = TRUE)
  rlang::check_installed("curl")
  curl::curl_download(d_url, file.path(d, basename(path)))
}

#' Download new lexicon and save it into the inst folder
#'
#' @param path relative path from repository
#'   <https://github.com/bluesky-social/atproto>.
#'
#' @return The corresponding json file
#'
#' @examples
#' \dontrun{
#' read_lexicon("app/bsky/actor/getProfile.json")
#' }
#' @noRd
read_lexicon <- function(path) {
  local_path <- file.path(system.file("lexicons", package = "atrrr"), path)

  if (!file.exists(local_path)) {
    warning("No corresponding lexicon found. Trying to download the lexicon.")
    get_lexicon(path)
  }

  if (!file.exists(local_path)) {
    stop(glue::glue("No lexicon found at {path}. Check the path. "))
  }
  rlang::check_installed("jsonlite")
  jsonlite::read_json(local_path)
}
