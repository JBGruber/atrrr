#' com_atproto_server_confirm_email
#' Confirm an email using a token from com.atproto.server.requestEmailConfirmation.
#' @noRd
com_atproto_server_confirm_email <- function(email, token, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.confirmEmail",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_server_create_account
#' Create an account.
#' @noRd
com_atproto_server_create_account <- function(email, handle, password, did = NULL, inviteCode = NULL, recoveryKey = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.createAccount",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_server_create_app_password
#' Create an app-specific password.
#' @noRd
com_atproto_server_create_app_password <- function(name, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.createAppPassword",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_server_create_invite_code
#' Create an invite code.
#' @noRd
com_atproto_server_create_invite_code <- function(useCount, forAccount = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.createInviteCode",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_server_create_invite_codes
#' Create an invite code.
#' @noRd
com_atproto_server_create_invite_codes <- function(codeCount, useCount, forAccounts = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.createInviteCodes",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_server_create_session
#' Create an authentication session.
#' @noRd
com_atproto_server_create_session <- function(identifier, password, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.createSession",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_server_delete_account
#' Delete a user account with a token and password.
#' @noRd
com_atproto_server_delete_account <- function(did, password, token, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.deleteAccount",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_server_delete_session
#' Delete the current session.
#' @noRd
com_atproto_server_delete_session <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.deleteSession",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_server_describe_server
#' Get a document describing the service's accounts configuration.
#' @noRd
com_atproto_server_describe_server <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.describeServer",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_server_get_account_invite_codes
#' Get all invite codes for a given account
#' @noRd
com_atproto_server_get_account_invite_codes <- function(includeUsed = NULL, createAvailable = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.getAccountInviteCodes",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_server_get_session
#' Get information about the current session.
#' @noRd
com_atproto_server_get_session <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.getSession",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_server_list_app_passwords
#' List all app-specific passwords.
#' @noRd
com_atproto_server_list_app_passwords <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.listAppPasswords",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_server_refresh_session
#' Refresh an authentication session.
#' @noRd
com_atproto_server_refresh_session <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.refreshSession",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_server_request_account_delete
#' Initiate a user account deletion via email.
#' @noRd
com_atproto_server_request_account_delete <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.requestAccountDelete",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_server_request_email_confirmation
#' Request an email with a code to confirm ownership of email
#' @noRd
com_atproto_server_request_email_confirmation <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.requestEmailConfirmation",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_server_request_email_update
#' Request a token in order to update email.
#' @noRd
com_atproto_server_request_email_update <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.requestEmailUpdate",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_server_request_password_reset
#' Initiate a user account password reset via email.
#' @noRd
com_atproto_server_request_password_reset <- function(email, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.requestPasswordReset",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_server_reset_password
#' Reset a user account password using a token.
#' @noRd
com_atproto_server_reset_password <- function(token, password, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.resetPassword",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_server_revoke_app_password
#' Revoke an app-specific password by name.
#' @noRd
com_atproto_server_revoke_app_password <- function(name, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.revokeAppPassword",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_server_update_email
#' Update an account's email.
#' @noRd
com_atproto_server_update_email <- function(email, token = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.updateEmail",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}
