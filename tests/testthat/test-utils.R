test_that("verbosity", {
  expect_equal(verbosity(NULL), FALSE)
  expect_equal(verbosity(TRUE), TRUE)
  expect_equal(verbosity(FALSE), FALSE)
  expect_equal({
    options("ATR_VERBOSE" = TRUE)
    verbosity(NULL)
  }, TRUE)
  expect_equal({
    options("ATR_VERBOSE" = NULL)
    Sys.setenv("ATR_VERBOSE" = TRUE)
    verbosity(NULL)
  }, TRUE)
  expect_equal({
    options("ATR_VERBOSE" = FALSE)
    verbosity(NULL)
  }, FALSE)
})


test_that("byte-accurate string locate", {
  text <- "✨ example mentioning @atproto.com to share the URL 👨‍❤️‍👨 https://en.wikipedia.org/wiki/CBOR."
  # tested against outcome of the code in <https://atproto.com/blog/create-post#mentions-and-links>
  expect_equal({
    str_locate_all_bytes(text, regexs$mention_regex)
  }, tibble::tibble(start = 23, end = 35, match = "@atproto.com"))
  expect_equal({
    str_locate_all_bytes(text, regexs$url_regex)
  }, tibble::tibble(start = 74, end = 108, match = "https://en.wikipedia.org/wiki/CBOR"))
})


test_that("as_iso_date works with various input types", {

  expect_match(
    as_iso_date("2025-01-16"),
    "^2025-01-\\d{2}T\\d{2}:00:00\\.000Z$"
  )

  expect_match(
    as_iso_date(as.Date("2025-01-16")),
    "^2025-01-\\d{2}T\\d{2}:00:00\\.000Z$"
  )

  expect_match(
    as_iso_date("2025-01-16 14:45:30"),
    "^2025-01-\\d{2}T\\d{2}:45:30\\.000Z$"
  )

  expect_match(
    as_iso_date(as.POSIXct("2025-01-16 14:45:30", tz = "UTC")),
    "^2025-01-\\d{2}T\\d{2}:45:30\\.000Z$"
  )
})

