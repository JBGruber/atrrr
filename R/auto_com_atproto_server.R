#' com_atproto_server_activate_account
#' Activates a currently deactivated account. Used to finalize account migration after the account's repo is imported and identity is setup.
#' @noRd
com_atproto_server_activate_account <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.server.activateAccount",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_server_check_account_status
#' Returns the status of an account, especially as pertaining to import or recovery. Can be called many times over the course of an account migration. Requires auth and can only be called pertaining to oneself.
#' @noRd
com_atproto_server_check_account_status <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.server.checkAccountStatus",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_server_confirm_email
#' Confirm an email using a token from com.atproto.server.requestEmailConfirmation.
#' @noRd
com_atproto_server_confirm_email <- function(email, token, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.server.confirmEmail",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_server_create_account
#' Create an account. Implemented by PDS.
#' @noRd
com_atproto_server_create_account <- function(handle, email = NULL, did = NULL, inviteCode = NULL, verificationCode = NULL, verificationPhone = NULL, password = NULL, recoveryKey = NULL, plcOp = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.server.createAccount",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_server_create_app_password
#' Create an App Password.
#' @noRd
com_atproto_server_create_app_password <- function(name, privileged = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.server.createAppPassword",
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
    name = "bsky.social/xrpc/com.atproto.server.createInviteCode",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_server_create_invite_codes
#' Create invite codes.
#' @noRd
com_atproto_server_create_invite_codes <- function(codeCount, useCount, forAccounts = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.server.createInviteCodes",
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
com_atproto_server_create_session <- function(identifier, password, authFactorToken = NULL, allowTakendown = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.server.createSession",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_server_deactivate_account
#' Deactivates a currently active account. Stops serving of repo, and future writes to repo until reactivated. Used to finalize account migration with the old host after the account has been activated on the new host.
#' @noRd
com_atproto_server_deactivate_account <- function(deleteAfter = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.server.deactivateAccount",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_server_delete_account
#' Delete an actor's account with a token and password. Can only be called after requesting a deletion token. Requires auth.
#' @noRd
com_atproto_server_delete_account <- function(did, password, token, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.server.deleteAccount",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_server_delete_session
#' Delete the current session. Requires auth.
#' @noRd
com_atproto_server_delete_session <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.server.deleteSession",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_server_describe_server
#' Describes the server's account creation requirements and capabilities. Implemented by PDS.
#' @noRd
com_atproto_server_describe_server <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.server.describeServer",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_server_get_account_invite_codes
#' Get all invite codes for the current account. Requires auth.
#' @noRd
com_atproto_server_get_account_invite_codes <- function(includeUsed = NULL, createAvailable = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.server.getAccountInviteCodes",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_server_get_service_auth
#' Get a signed token on behalf of the requesting DID for the requested service.
#' @noRd
com_atproto_server_get_service_auth <- function(aud, exp = NULL, lxm = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.server.getServiceAuth",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_server_get_session
#' Get information about the current auth session. Requires auth.
#' @noRd
com_atproto_server_get_session <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.server.getSession",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_server_list_app_passwords
#' List all App Passwords.
#' @noRd
com_atproto_server_list_app_passwords <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.server.listAppPasswords",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' com_atproto_server_refresh_session
#' Refresh an authentication session. Requires auth using the 'refreshJwt' (not the 'accessJwt').
#' @noRd
com_atproto_server_refresh_session <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.server.refreshSession",
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
    name = "bsky.social/xrpc/com.atproto.server.requestAccountDelete",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_server_request_email_confirmation
#' Request an email with a code to confirm ownership of email.
#' @noRd
com_atproto_server_request_email_confirmation <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.server.requestEmailConfirmation",
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
    name = "bsky.social/xrpc/com.atproto.server.requestEmailUpdate",
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
    name = "bsky.social/xrpc/com.atproto.server.requestPasswordReset",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_server_reserve_signing_key
#' Reserve a repo signing key, for use with account creation. Necessary so that a DID PLC update operation can be constructed during an account migraiton. Public and does not require auth; implemented by PDS. NOTE: this endpoint may change when full account migration is implemented.
#' @noRd
com_atproto_server_reserve_signing_key <- function(did = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.server.reserveSigningKey",
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
    name = "bsky.social/xrpc/com.atproto.server.resetPassword",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' com_atproto_server_revoke_app_password
#' Revoke an App Password by name.
#' @noRd
com_atproto_server_revoke_app_password <- function(name, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.server.revokeAppPassword",
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
com_atproto_server_update_email <- function(email, emailAuthFactor = NULL, token = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/com.atproto.server.updateEmail",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}
