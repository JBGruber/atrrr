#' com_atproto_repo_apply_writes
#' Apply a batch transaction of creates, updates, and deletes.
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
#' Create a new record.
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
#' Delete a record, or ensure it doesn't exist.
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
#' Get information about the repo, including the list of collections.
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
#' Get a record.
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



#' com_atproto_repo_list_records
#' List a range of records in a collection.
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
#' Write a record, creating or updating it as needed.
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
#' Upload a new blob to be added to repo in a later request.
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
