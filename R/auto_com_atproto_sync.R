#' com_atproto_sync_get_blob
#' Get a blob associated with a given account. Returns the full blob as originally uploaded. Does not require auth; implemented by PDS.
#' @noRd
com_atproto_sync_get_blob <- function(did, cid, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.sync.getBlob",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_sync_get_blocks
#' Get data blocks from a given repo, by CID. For example, intermediate MST nodes, or records. Does not require auth; implemented by PDS.
#' @noRd
com_atproto_sync_get_blocks <- function(did, cids, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.sync.getBlocks",
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
    name = "bsky.social/xrpc/com.atproto.sync.getCheckout",
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
    name = "bsky.social/xrpc/com.atproto.sync.getHead",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_sync_get_host_status
#' Returns information about a specified upstream host, as consumed by the server. Implemented by relays.
#' @noRd
com_atproto_sync_get_host_status <- function(hostname, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.sync.getHostStatus",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_sync_get_latest_commit
#' Get the current commit CID & revision of the specified repo. Does not require auth.
#' @noRd
com_atproto_sync_get_latest_commit <- function(did, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.sync.getLatestCommit",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_sync_get_record
#' Get data blocks needed to prove the existence or non-existence of record in the current version of repo. Does not require auth.
#' @noRd
com_atproto_sync_get_record <- function(did, collection, rkey, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.sync.getRecord",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_sync_get_repo
#' Download a repository export as CAR file. Optionally only a 'diff' since a previous revision. Does not require auth; implemented by PDS.
#' @noRd
com_atproto_sync_get_repo <- function(did, since = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.sync.getRepo",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_sync_get_repo_status
#' Get the hosting status for a repository, on this server. Expected to be implemented by PDS and Relay.
#' @noRd
com_atproto_sync_get_repo_status <- function(did, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.sync.getRepoStatus",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_sync_list_blobs
#' List blob CIDs for an account, since some repo revision. Does not require auth; implemented by PDS.
#' @noRd
com_atproto_sync_list_blobs <- function(did, since = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.sync.listBlobs",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_sync_list_hosts
#' Enumerates upstream hosts (eg, PDS or relay instances) that this service consumes from. Implemented by relays.
#' @noRd
com_atproto_sync_list_hosts <- function(limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.sync.listHosts",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_sync_list_repos
#' Enumerates all the DID, rev, and commit CID for all repos hosted by this service. Does not require auth; implemented by PDS and Relay.
#' @noRd
com_atproto_sync_list_repos <- function(limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.sync.listRepos",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_sync_list_repos_by_collection
#' Enumerates all the DIDs which have records with the given collection NSID.
#' @noRd
com_atproto_sync_list_repos_by_collection <- function(collection, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.sync.listReposByCollection",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_sync_notify_of_update
#' Notify a crawling service of a recent update, and that crawling should resume. Intended use is after a gap between repo stream events caused the crawling service to disconnect. Does not require auth; implemented by Relay. DEPRECATED: just use com.atproto.sync.requestCrawl
#' @noRd
com_atproto_sync_notify_of_update <- function(hostname, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.sync.notifyOfUpdate",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_sync_request_crawl
#' Request a service to persistently crawl hosted repos. Expected use is new PDS instances declaring their existence to Relays. Does not require auth.
#' @noRd
com_atproto_sync_request_crawl <- function(hostname, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.sync.requestCrawl",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}
