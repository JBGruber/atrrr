test_that("get own feed", {
  expect_type(get_own_timeline(parse = FALSE), "list")
  expect_s3_class(get_own_timeline(), "tbl_df")
  expect_gte(nrow(get_own_timeline()), 1L)
})
