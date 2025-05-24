test_that("get skeets by author", {
  expect_type(get_skeets_authored_by("andrew.heiss.phd", parse = FALSE), "list")
  expect_s3_class(get_skeets_authored_by("andrew.heiss.phd"), "tbl_df")
  expect_gte(nrow(get_skeets_authored_by("andrew.heiss.phd")), 1L)
})

test_that("get feeds by author", {
  expect_type(get_feeds_created_by("andrew.heiss.phd", parse = FALSE), "list")
  expect_s3_class(get_feeds_created_by("andrew.heiss.phd"), "tbl_df")
  expect_gte(nrow(get_feeds_created_by("andrew.heiss.phd")), 1L)
})

test_that("search feeds", {
  expect_type(get_feeds_created_by("andrew.heiss.phd", parse = FALSE), "list")
  expect_s3_class(get_feeds_created_by("andrew.heiss.phd"), "tbl_df")
  expect_gte(nrow(get_feeds_created_by("andrew.heiss.phd")), 1L)
})

test_that("search feeds", {
  expect_type(search_feed("#rstats", parse = FALSE), "list")
  expect_s3_class(search_feed("#rstats"), "tbl_df")
  expect_gte(nrow(search_feed("#rstats")), 1L)
})

test_that("get feed", {
  expect_type(search_feed("#rstats", parse = FALSE), "list")
  expect_s3_class(search_feed("#rstats"), "tbl_df")
  expect_gte(nrow(search_feed("#rstats")), 1L)
})

test_that("get feed", {
  link <- "https://bsky.app/profile/did:plc:2zcfjzyocp6kapg6jc4eacok/feed/aaaeckvqc3gzg"
  expect_type(get_feed(link, parse = FALSE), "list")
  expect_s3_class(get_feed(link), "tbl_df")
  expect_gte(nrow(get_feed(link)), 1L)
  at_link <- "at://did:plc:2zcfjzyocp6kapg6jc4eacok/app.bsky.feed.generator/aaaeckvqc3gzg"
  expect_gte(nrow(get_feed(at_link)), 1L)
})

test_that("get own feed", {
  expect_type(get_own_timeline(parse = FALSE), "list")
  expect_s3_class(get_own_timeline(), "tbl_df")
  expect_gte(nrow(get_own_timeline()), 1L)
  expect_gte(nrow(get_own_timeline(algorithm = "reverse-chronological")), 1L)
})

test_that("get likes", {
  link <- "https://bsky.app/profile/jbgruber.bsky.social/post/3kbi55xm6u62v"
  expect_type(get_likes(link, parse = FALSE), "list")
  expect_s3_class(get_likes(link), "tbl_df")
  expect_equal(nrow(get_likes(link)), 49L)
  at_link <- "at://did:plc:ntd53albt5ffa4rgervvgibd/app.bsky.feed.post/3kbi55xm6u62v"
  expect_equal(nrow(get_likes(at_link)), 49L)
})

test_that("get reposts", {
  link <- "https://bsky.app/profile/jbgruber.bsky.social/post/3kbi55xm6u62v"
  expect_type(get_reposts(link, parse = FALSE), "list")
  expect_s3_class(get_reposts(link), "tbl_df")
  expect_equal(nrow(get_reposts(link)), 28L)
  at_link <- "at://did:plc:ntd53albt5ffa4rgervvgibd/app.bsky.feed.post/3kbi55xm6u62v"
  expect_equal(nrow(get_reposts(at_link)), 28L)
})

test_that("get feed likes", {
  link <- "https://bsky.app/profile/did:plc:2zcfjzyocp6kapg6jc4eacok/feed/aaaeckvqc3gzg"
  expect_type(get_feed_likes(link, parse = FALSE), "list")
  expect_s3_class(get_feed_likes(link), "tbl_df")
  expect_gte(nrow(get_feed_likes(link)), 1L)
  at_link <- "at://did:plc:2zcfjzyocp6kapg6jc4eacok/app.bsky.feed.generator/aaaeckvqc3gzg"
  expect_gte(nrow(get_feed_likes(at_link)), 1L)
})

test_that("get thread", {
  link <- "https://bsky.app/profile/jbgruber.bsky.social/post/3kbi57u4sys2l"
  expect_s3_class(get_thread(link), "tbl_df")
  # should be 4, but since requests are mocked, only children, not parents are
  # retrieved
  expect_gte(nrow(get_thread(link)), 2L)
  at_link <- "at://did:plc:ntd53albt5ffa4rgervvgibd/app.bsky.feed.post/3kbi57u4sys2l"
  expect_gte(nrow(get_thread(at_link)), 2L)
})

test_that("get replies", {
  link <- "https://bsky.app/profile/jbgruber.bsky.social/post/3kbi57u4sys2l"
  expect_s3_class(get_replies(link), "tbl_df")
  expect_gte(nrow(get_replies(link)), 2L)
  at_link <- "at://did:plc:ntd53albt5ffa4rgervvgibd/app.bsky.feed.post/3kbi57u4sys2l"
  expect_gte(nrow(get_replies(at_link)), 2L)
})

test_that("search posts", {
  expect_type(search_post("rstats", parse = FALSE), "list")
  expect_s3_class(search_post("rstats"), "tbl_df")
  expect_gte(nrow(search_post("rstats")), 100L)
  expect_gte(nrow(search_post("#rstats")), 100L)
  expect_equal({
    nrow(
      search_post("{atrrr}",
                  sort = "top",
                  since = "2024-12-05T00:00:00.000Z",
                  until = "2024-12-07T10:00:00.000Z",
                  mentions = NULL,
                  author = "jbgruber.bsky.social",
                  # lang = "",
                  domain = "jbgruber.github.io",
                  url = "https://jbgruber.github.io/atrrr",
                  tag = "rstats")
    )
  }, 1L)
})
