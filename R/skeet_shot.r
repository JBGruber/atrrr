#' Take high quality screenshots of skeets
#'
#' @param x a vector of URLs or URIs.
#' @param file output file name. Defaults to the skeet id.
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
skeet_shot <- function(x, file = NULL, ...) {
  rlang::check_installed("webshot2")
  out <- purrr::map_chr(x, function(x2) {
    if (is_at(x2)) {
      x2 <- convert_at_to_http(x2)
    }
    if (is.null(file)) {
      id <- parse_http_url(x2)$rkey
      file <- paste0(id, ".png")
    }
    out <- webshot2::webshot(x2,
                             file = file,
                             selector = ".r-5kkj8d",
                             quiet = TRUE,
                             ...)
    cli::cli_alert_success("skeet {id} saved as {out}")
    return(out)
  })
  invisible(out)
}

