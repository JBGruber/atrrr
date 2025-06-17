#' Take high quality screenshots of skeets
#'
#' @param x a vector of URLs or URIs.
#' @param file output file name. Defaults to the skeet id.
#' @param delay time to wait for content to load. Can make sense to increase if
#'   not everything is loaded in the screentshot yet.
#' @param ... passed on to \link[webshot2]{webshot}.
#'
#' @return path to file
#' @export
#'
#' @examples
#' \dontrun{
#' df <- atrrr::search_post("rstats")
#' skeet_shot(df$uri[1:2])
#' }
skeet_shot <- function(x,
                       file = NULL,
                       delay = 1,
                       ...) {
  rlang::check_installed("chromote")
  out <- purrr::map_chr(x, function(x2) {
    if (is_at(x2)) {
      x2 <- convert_at_to_http(x2)
    }
    id <- parse_http_url(x2)$rkey
    if (is.null(file)) {
      file <- paste0(id, ".png")
    }
    # embed post
    tmp <- tempfile(fileext = ".html")
    httr2::request("https://embed.bsky.app/oembed") |>
      httr2::req_url_query(
        url = x2
      ) |>
      httr2::req_perform() |>
      httr2::resp_body_json() |>
      purrr::pluck("html") |>
      writeLines(tmp)

    # screenshot returned html code
    out <- webshot2::webshot(
      tmp,
      file = file,
      selector = "iframe",
      delay = delay,
      quiet = TRUE,
      ...
    )
    cli::cli_alert_success("skeet {id} saved as {out}")
    return(out)
  })
  invisible(out)
}

