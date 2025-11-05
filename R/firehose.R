#' Stream from the Bluesky Firehose
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' Bluesky offers a stream of all events created,
#' edited and deleted on the platform and the wider
#' AT protocol using network. This function connects
#' to it and decrypts the stream. See examples for
#' how to provide a function that handles the
#' firehose stream.
#'
#'
#' @param fun a function that takes events from the Bluesky Firehose and processes them. See examples.
#' @param timeout how long to stream from the Bluesky Firehose. Can be `Inf` to keep streaming until interrupted.
#'
#' @returns nothing itself, used to run `fun`
#' @export
#'
#' @examplesIf rlang::is_installed("libipldr")
#' # an example function that saves events as RDS files
#' stream2rds <- function(events) {
#'   for (event in events) {
#'     commit <- event$commit
#'     # ignore events without a commit message
#'     if (!is.null(commit)) {
#'       saveRDS(event, paste0(event$commit, ".rds"), compress = FALSE)
#'     }
#'   }
#' }
#' stream_firehose(stream2rds, timeout = 15)
#'
#' # an example function that saves events as JSON files
#' stream2json <- function(events) {
#'   for (event in events) {
#'     commit <- event$commit
#'     # ignore events without a commit message
#'     if (!is.null(commit)) {
#'       jsonlite::write_json(event, file(paste0(event$commit, ".json")), pretty = TRUE)
#'     }
#'   }
#' }
#' stream_firehose(stream2json, timeout = 15)
#'
#' # an example function that prints posts to the Console
#' print_stream <- function(events) {
#'   for (event in events) {
#'     commit <- event$commit
#'     # ignore events without a commit message
#'     if (is.null(commit)) next
#'     # decode actual block data which contains text
#'     event$data <- libipldr::decode_car(event$blocks)$blocks
#'     message <- purrr::map(event$data, "text", .default = NULL) |>
#'       purrr::compact()
#'     if (length(message) == 0L) next
#'     print(cli::boxx(message, background_col = sample(colors(), 1L)))
#'   }
#' }
#' stream_firehose(print_stream, timeout = 15)
stream_firehose <- function(fun, timeout = 30) {
  rlang::check_installed(
    pkg = "libipldr",
    reason = "to access the Bluesky Firehose",
    action = function(pkg, ...) {
      rlang::check_installed("remotes")
      remotes::install_github("JBGruber/libipldr", ...)
    }
  )

  conn <- curl::curl("wss://bsky.network/xrpc/com.atproto.sync.subscribeRepos")
  start_time <- Sys.time()
  open(conn, "rbf", blocking = FALSE)
  on.exit(close(conn))
  buffer <- raw()
  repeat {
    buffer <- c(buffer, readBin(conn, what = "raw", n = 1024))
    if (length(buffer) > 0) {
      events <- libipldr::decode_dag_cbor_multi(buffer)
      if (length(events) > 0L) {
        fun(events)
        # remove translated bytes from buffer
        buffer <- utils::tail(buffer, -attr(events, "bytes_consumed"))
        if (Sys.time() > start_time + timeout) break
      }
    }
  }
}
