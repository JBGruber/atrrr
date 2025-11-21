# Stream from the Bluesky Firehose

**\[experimental\]**

Bluesky offers a stream of all events created, edited and deleted on the
platform and the wider AT protocol using network. This function connects
to it and decrypts the stream. See examples for how to provide a
function that handles the firehose stream.

## Usage

``` r
stream_firehose(fun, timeout = 30)
```

## Arguments

- fun:

  a function that takes events from the Bluesky Firehose and processes
  them. See examples.

- timeout:

  how long to stream from the Bluesky Firehose. Can be `Inf` to keep
  streaming until interrupted.

## Value

nothing itself, used to run `fun`

## Examples

``` r
if (FALSE) { # rlang::is_installed("libipldr")
# an example function that saves events as RDS files
stream2rds <- function(events) {
  for (event in events) {
    commit <- event$commit
    # ignore events without a commit message
    if (!is.null(commit)) {
      saveRDS(event, paste0(event$commit, ".rds"), compress = FALSE)
    }
  }
}
stream_firehose(stream2rds, timeout = 15)

# an example function that saves events as JSON files
stream2json <- function(events) {
  for (event in events) {
    commit <- event$commit
    # ignore events without a commit message
    if (!is.null(commit)) {
      jsonlite::write_json(event, file(paste0(event$commit, ".json")), pretty = TRUE)
    }
  }
}
stream_firehose(stream2json, timeout = 15)

# an example function that prints posts to the Console
print_stream <- function(events) {
  for (event in events) {
    commit <- event$commit
    # ignore events without a commit message
    if (is.null(commit)) next
    # decode actual block data which contains text
    event$data <- libipldr::decode_car(event$blocks)$blocks
    message <- purrr::map(event$data, "text", .default = NULL) |>
      purrr::compact()
    if (length(message) == 0L) next
    print(cli::boxx(message, background_col = sample(colors(), 1L)))
  }
}
stream_firehose(print_stream, timeout = 15)
}
```
