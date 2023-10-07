#' com_atproto_admin_disable_account_invites
#' Disable an account from receiving new invite codes, but does not invalidate existing codes
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
#' Disable some set of codes and/or all codes associated with a set of users
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
#' Re-enable an accounts ability to receive invite codes
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



#' com_atproto_admin_get_invite_codes
#' Admin view of invite codes
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



#' com_atproto_admin_get_moderation_action
#' View details about a moderation action.
#' @noRd
com_atproto_admin_get_moderation_action <- function(id, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.getModerationAction",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_admin_get_moderation_actions
#' List moderation actions related to a subject.
#' @noRd
com_atproto_admin_get_moderation_actions <- function(subject = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.getModerationActions",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_admin_get_moderation_report
#' View details about a moderation report.
#' @noRd
com_atproto_admin_get_moderation_report <- function(id, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.getModerationReport",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_admin_get_moderation_reports
#' List moderation reports related to a subject.
#' @noRd
com_atproto_admin_get_moderation_reports <- function(subject = NULL, ignoreSubjects = NULL, actionedBy = NULL, reporters = NULL, resolved = NULL, actionType = NULL, limit = NULL, cursor = NULL, reverse = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.getModerationReports",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_admin_get_record
#' View details about a record.
#' @noRd
com_atproto_admin_get_record <- function(uri, cid = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.getRecord",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_admin_get_repo
#' View details about a repository.
#' @noRd
com_atproto_admin_get_repo <- function(did, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.getRepo",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_admin_resolve_moderation_reports
#' Resolve moderation reports by an action.
#' @noRd
com_atproto_admin_resolve_moderation_reports <- function(actionId, reportIds, createdBy, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.resolveModerationReports",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_admin_reverse_moderation_action
#' Reverse a moderation action.
#' @noRd
com_atproto_admin_reverse_moderation_action <- function(id, reason, createdBy, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.reverseModerationAction",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_admin_search_repos
#' Find repositories based on a search term.
#' @noRd
com_atproto_admin_search_repos <- function(term = NULL, q = NULL, invitedBy = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.searchRepos",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_admin_send_email
#' Send email to a user's primary email address
#' @noRd
com_atproto_admin_send_email <- function(recipientDid, content, subject = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.sendEmail",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_admin_take_moderation_action
#' Take a moderation action on a repo.
#' @noRd
com_atproto_admin_take_moderation_action <- function(action, subject, reason, createdBy, subjectBlobCids = NULL, createLabelVals = NULL, negateLabelVals = NULL, durationInHours = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.takeModerationAction",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_admin_update_account_email
#' Administrative action to update an account's email
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
#' Administrative action to update an account's handle
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
