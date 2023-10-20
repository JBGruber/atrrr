test_that("verbosity", {
  expect_equal(verbosity(NULL), TRUE)
  expect_equal(verbosity(TRUE), TRUE)
  expect_equal(verbosity(FALSE), FALSE)
  expect_equal(
    withr::with_envvar(list(ATR_VERBOSE =  FALSE), verbosity(NULL)),
    FALSE
  )
})
