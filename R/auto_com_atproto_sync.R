#' com_atproto_sync_get_blob
#' Get a blob associated with a given repo.
#' @noRd
com_atproto_sync_get_blob <- function(did, cid, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.sync.getBlob",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_sync_get_blocks
#' Gets blocks from a given repo.
#' @noRd
com_atproto_sync_get_blocks <- function(did, cids, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.sync.getBlocks",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_sync_get_checkout
#' DEPRECATED - please use com.atproto.sync.getRepo instead
#' @noRd
com_atproto_sync_get_checkout <- function(did, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.sync.getCheckout",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_sync_get_head
#' DEPRECATED - please use com.atproto.sync.getLatestCommit instead
#' @noRd
com_atproto_sync_get_head <- function(did, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.sync.getHead",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_sync_get_latest_commit
#' Gets the current commit CID & revision of the repo.
#' @noRd
com_atproto_sync_get_latest_commit <- function(did, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.sync.getLatestCommit",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_sync_get_record
#' Gets blocks needed for existence or non-existence of record.
#' @noRd
com_atproto_sync_get_record <- function(did, collection, rkey, commit = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.sync.getRecord",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_sync_get_repo
#' Gets the did's repo, optionally catching up from a specific revision.
#' @noRd
com_atproto_sync_get_repo <- function(did, since = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.sync.getRepo",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_sync_list_blobs
#' List blob cids since some revision
#' @noRd
com_atproto_sync_list_blobs <- function(did, since = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.sync.listBlobs",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_sync_list_repos
#' List dids and root cids of hosted repos
#' @noRd
com_atproto_sync_list_repos <- function(limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.sync.listRepos",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_sync_notify_of_update
#' Notify a crawling service of a recent update. Often when a long break between updates causes the connection with the crawling service to break.
#' @noRd
com_atproto_sync_notify_of_update <- function(hostname, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.sync.notifyOfUpdate",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_sync_request_crawl
#' Request a service to persistently crawl hosted repos.
#' @noRd
com_atproto_sync_request_crawl <- function(hostname, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.sync.requestCrawl",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}
