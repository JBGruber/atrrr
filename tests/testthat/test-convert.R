http_link <- "https://bsky.app/profile/benguinaudeau.bsky.social/post/3kbi5v7oncq25"
at_link <- "at://did:plc:vuvsifrusnjsys7mhkpk662u/app.bsky.feed.post/3kbi5v7oncq25"

test_that("conversion works", {
  # turn off mocking for these
  skip_if(!dir.exists(tools::R_user_dir("atrrr", "cache")))
  op_mock <- options("httr2_mock" = NULL)
  on.exit(options(op_mock), add = TRUE, after = FALSE)

  expect_equal(convert_http_to_at(http_link), at_link)
  expect_equal(convert_http_to_at(at_link), at_link)
  expect_equal(convert_at_to_http(at_link), http_link)
})

test_that("conversion is safe", {
  skip_if(!dir.exists(tools::R_user_dir("atrrr", "cache")))
  # turn off mocking for these
  op_mock <- options("httr2_mock" = NULL)
  on.exit(options(op_mock), add = TRUE, after = FALSE)

  expect_equal(convert_http_to_at(c("", NA, http_link)), c(NA, NA, at_link))
  expect_equal(convert_http_to_at(c("", NA, at_link)), c(NA, NA, at_link))
  expect_equal(convert_at_to_http(c("", NA, at_link)), c(NA, NA, http_link))
})
