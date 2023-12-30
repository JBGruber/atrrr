test_that("get skeets by author", {
  expect_type(get_skeets_authored_by("profmusgrave.bsky.social", parse = FALSE), "list")
  expect_s3_class(get_skeets_authored_by("profmusgrave.bsky.social"), "tbl_df")
  expect_gte(nrow(get_skeets_authored_by("profmusgrave.bsky.social")), 1L)
})


test_that("get own feed", {
  expect_type(get_own_timeline(parse = FALSE), "list")
  expect_s3_class(get_own_timeline(), "tbl_df")
  expect_gte(nrow(get_own_timeline()), 1L)
})
