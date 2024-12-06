#' com_atproto_admin_delete_account
#' Delete a user account as an administrator.
#' @noRd
com_atproto_admin_delete_account <- function(did, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.deleteAccount",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_admin_disable_account_invites
#' Disable an account from receiving new invite codes, but does not invalidate existing codes.
#' @noRd
com_atproto_admin_disable_account_invites <- function(account, note = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.disableAccountInvites",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_admin_disable_invite_codes
#' Disable some set of codes and/or all codes associated with a set of users.
#' @noRd
com_atproto_admin_disable_invite_codes <- function(codes = NULL, accounts = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.disableInviteCodes",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_admin_enable_account_invites
#' Re-enable an account's ability to receive invite codes.
#' @noRd
com_atproto_admin_enable_account_invites <- function(account, note = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.enableAccountInvites",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_admin_get_account_info
#' Get details about an account.
#' @noRd
com_atproto_admin_get_account_info <- function(did, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.getAccountInfo",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_admin_get_account_infos
#' Get details about some accounts.
#' @noRd
com_atproto_admin_get_account_infos <- function(dids, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.getAccountInfos",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_admin_get_invite_codes
#' Get an admin view of invite codes.
#' @noRd
com_atproto_admin_get_invite_codes <- function(sort = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.getInviteCodes",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_admin_get_subject_status
#' Get the service-specific admin status of a subject (account, record, or blob).
#' @noRd
com_atproto_admin_get_subject_status <- function(did = NULL, uri = NULL, blob = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.getSubjectStatus",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_admin_search_accounts
#' Get list of accounts that matches your search query.
#' @noRd
com_atproto_admin_search_accounts <- function(email = NULL, cursor = NULL, limit = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.searchAccounts",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_admin_send_email
#' Send email to a user's account email address.
#' @noRd
com_atproto_admin_send_email <- function(recipientDid, content, senderDid, subject = NULL, comment = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.sendEmail",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_admin_update_account_email
#' Administrative action to update an account's email.
#' @noRd
com_atproto_admin_update_account_email <- function(account, email, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.updateAccountEmail",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_admin_update_account_handle
#' Administrative action to update an account's handle.
#' @noRd
com_atproto_admin_update_account_handle <- function(did, handle, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.updateAccountHandle",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_admin_update_account_password
#' Update the password for a user account as an administrator.
#' @noRd
com_atproto_admin_update_account_password <- function(did, password, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.updateAccountPassword",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_admin_update_subject_status
#' Update the service-specific admin status of a subject (account, record, or blob).
#' @noRd
com_atproto_admin_update_subject_status <- function(subject, takedown = NULL, deactivated = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.updateSubjectStatus",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}
