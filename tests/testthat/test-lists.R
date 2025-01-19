test_that("test getting list", {
  test <- "https://bsky.app/profile/smachlis.bsky.social/lists/3l7o5d7b7nl2q"
  expect_type(get_list(test, parse = FALSE), "list")
  expect_s3_class(get_list(test), "tbl_df")
  expect_gte(nrow(get_list(test)), 1L)
  expect_contains(colnames(get_list(test)),
                  c("uri", "subject_did",  "subject_handle",
                    "list_uri", "list_cid", "list_name"))


  get_starter_pack("https://bsky.app/starter-pack/sof14g1l.bsky.social/3lbc4bqetfp22")

})

test_that("test getting list feed", {
  test <- "https://bsky.app/profile/smachlis.bsky.social/lists/3l7o5d7b7nl2q"
  expect_type(get_list_feed(test, parse = FALSE), "list")
  expect_s3_class(get_list_feed(test), "tbl_df")
  expect_gte(nrow(get_list_feed(test)), 1L)
  expect_contains(colnames(get_list_feed(test)),
                  c("uri", "author_name", "text",
                    "reply_count", "repost_count",
                    "like_count", "quote_count"))
})

test_that("test getting list feed", {
  test <- "https://bsky.app/starter-pack/sof14g1l.bsky.social/3lbc4bqetfp22"
  expect_s3_class(get_starter_pack(test), "tbl_df")
  expect_gte(nrow(get_starter_pack(test)), 1L)
  expect_contains(colnames(get_starter_pack(test)),
                  c("user_uri", "user_did", "user_handle",
                    "list_uri", "list_cid", "list_record_type",
                    "list_record_created_at"))
})
