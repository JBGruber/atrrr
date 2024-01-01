test_that("search actors", {
  expect_type(search_user("benguinaudeau.bsky.social", parse = FALSE), "list")
  expect_s3_class(search_user("favstats.eu"), "tbl_df")
  expect_gte(nrow(search_user("JBGruber")), 1L)
})

test_that("search actors", {
  expect_type(get_user_info("benguinaudeau.bsky.social", parse = FALSE), "list")
  expect_s3_class(get_user_info("jbgruber.bsky.social"), "tbl_df")
  expect_gte(nrow(get_user_info("favstats.bsky.social")), 1L)
})
