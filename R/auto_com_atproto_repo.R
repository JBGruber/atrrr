#' com_atproto_repo_apply_writes
#' Apply a batch transaction of repository creates, updates, and deletes. Requires auth, implemented by PDS.
#' @noRd
com_atproto_repo_apply_writes <- function(repo, writes, validate = NULL, swapCommit = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.repo.applyWrites",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_repo_create_record
#' Create a single new repository record. Requires auth, implemented by PDS.
#' @noRd
com_atproto_repo_create_record <- function(repo, collection, record, rkey = NULL, validate = NULL, swapCommit = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.repo.createRecord",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_repo_delete_record
#' Delete a repository record, or ensure it doesn't exist. Requires auth, implemented by PDS.
#' @noRd
com_atproto_repo_delete_record <- function(repo, collection, rkey, swapRecord = NULL, swapCommit = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.repo.deleteRecord",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_repo_describe_repo
#' Get information about an account and repository, including the list of collections. Does not require auth.
#' @noRd
com_atproto_repo_describe_repo <- function(repo, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.repo.describeRepo",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_repo_get_record
#' Get a single record from a repository. Does not require auth.
#' @noRd
com_atproto_repo_get_record <- function(repo, collection, rkey, cid = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.repo.getRecord",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_repo_import_repo
#' Import a repo in the form of a CAR file. Requires Content-Length HTTP header to be set.
#' @noRd
com_atproto_repo_import_repo <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.repo.importRepo",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_repo_list_missing_blobs
#' Returns a list of missing blobs for the requesting account. Intended to be used in the account migration flow.
#' @noRd
com_atproto_repo_list_missing_blobs <- function(limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.repo.listMissingBlobs",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_repo_list_records
#' List a range of records in a repository, matching a specific collection. Does not require auth.
#' @noRd
com_atproto_repo_list_records <- function(repo, collection, limit = NULL, cursor = NULL, rkeyStart = NULL, rkeyEnd = NULL, reverse = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.repo.listRecords",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_repo_put_record
#' Write a repository record, creating or updating it as needed. Requires auth, implemented by PDS.
#' @noRd
com_atproto_repo_put_record <- function(repo, collection, rkey, record, validate = NULL, swapRecord = NULL, swapCommit = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.repo.putRecord",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_repo_upload_blob
#' Upload a new blob, to be referenced from a repository record. The blob will be deleted if it is not referenced within a time window (eg, minutes). Blob restrictions (mimetype, size, etc) are enforced when the reference is created. Requires auth, implemented by PDS.
#' @noRd
com_atproto_repo_upload_blob <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.repo.uploadBlob",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}
