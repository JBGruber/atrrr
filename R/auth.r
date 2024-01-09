#' Authenticate for the  API
#'
#' @description Run authentication for a network using the AT protocol (e.g.,
#'   ['Blue Sky'](https://bsky.app/)) and save the token permanently.
#'
#' @param user Your user handle (e.g, benguinaudeau.bsky.social).
#' @param password Your app password (usually created on
#'   <https://bsky.app/settings/app-passwords>).
#' @param domain For now https://bsky.app/, but could change in the future.
#' @param overwrite If TRUE, overwrites old token without asking for
#'   confirmation.
#' @param token (Stale) token object. Usually you don't need to use this. But if
#'   you manage your own tokens and they get stale, you can use this parameter
#'   and request a fresh token.
#'
#' @inheritParams search_user
#' @returns An authentication token (invisible)
#'
#' @details After requesting the token, it is saved in the location returned by
#'   `file.path(tools::R_user_dir("atrrr", "cache"), Sys.getenv("BSKY_TOKEN",
#'   unset = "token.rds"))`. If you have multiple tokens, you can use
#'   `Sys.setenv(BSKY_TOKEN = "filename.rds")` to save/load the token with a
#'   different name.
#'
#' @examples
#' \dontrun{
#' # request a token
#' auth() # this will guide you through all steps
#'
#' # the token is stored in the location returned by this command
#' file.path(tools::R_user_dir("atrrr", "cache"),
#'           Sys.getenv("BSKY_TOKEN", unset = "token.rds"))
#'
#' # to use a different than the default file name for the token, set BSKY_TOKEN
#' Sys.setenv(BSKY_TOKEN = "identity-2.rds")
#'
#' # now either rename your token file or request a new token
#' auth()
#'
#' # the cache now contains two tokens
#' list.files(tools::R_user_dir("atrrr", "cache"))
#'
#' # functions that interact with the API also take a .token argument with the
#' # path. For example:
#' tok_path <- file.path(tools::R_user_dir("atrrr", "cache"), "identity-2.rds")
#' get_skeets_authored_by(actor = "benguinaudeau.bsky.social", parse = TRUE,
#'                        .token = tok_path)
#' }
#'
#' @export
auth <- function(user,
                 password,
                 domain = "https://bsky.app/",
                 verbose = TRUE,
                 overwrite = FALSE,
                 token = NULL) {

  if (is.null(token)) {
    url <- list(
      scheme = "https",
      hostname = httr2::url_parse(domain)$hostname,
      path = "/settings/app-passwords"
    ) |>
      httr2::url_build()

    if (missing(user)) {
      rlang::check_installed("askpass")
      user <- askpass::askpass(
        "Please enter your username (e.g., \"jbgruber.bsky.social\") password"
      )
    }

    if(missing(password) || is.null(password)) {
      if (interactive()) {
        if (verbosity(verbose)) cli::cli_alert_info("Navigate to {.url {url}} and create a new app password")
        utils::browseURL(url)
        password <- askpass::askpass("Please enter your app password")
      } else {
        cli::cli_abort("You need to run {.fn auth} in an interactive session")
      }
    }

    if (!is.null(user) && !is.null(password)) {
      token <- req_token(user, password)
    } else {
      cli::cli_abort("You need to supply username and password.")
    }
  } else {
    if (!methods::is(token, "bsky_token")) {
      cli::cli_abort("token needs to be an object of class {.emph bsky_token}")
    }
    token <- refresh_token(token)
  }

  token$domain <- domain
  token$accessJwt <- token$accessJwt
  token$refreshJwt <- token$refreshJwt
  # it's not clear how long a token is valid. The docs say 'couple minutes'
  token$valid_until <- Sys.time() + 3 * 60
  # TODO: should not be necessary, but refresh seems broken
  token$password <- password

  class(token) <- "bsky_token"

  f <- Sys.getenv("BSKY_TOKEN", unset = "token.rds")
  p <- tools::R_user_dir("atrrr", "cache")
  dir.create(p, showWarnings = FALSE, recursive = TRUE)

  # store in cache
  rlang::env_poke(env = the, nm = "bsky_token", value = token, create = TRUE)

  sel <- TRUE
  if (file.exists(file.path(p, f)) && !overwrite) {
    sel <- utils::askYesNo(
      "A token already exists on disk. Do you want to overwrite it?",
      default = FALSE
    )
  }

  if (isTRUE(sel)) {
    httr2::secret_write_rds(
      x = token, path = file.path(p, f),
      key = I(rlang::hash("musksucks"))
    )
    if (verbosity(verbose)) cli::cli_alert_success("Succesfully authenticated!")
    invisible(token)
  }
}


req_token <- function(user, password) {
  # https://atproto.com/specs/xrpc#authentication
  httr2::request("https://bsky.social/xrpc/com.atproto.server.createSession") |>
    httr2::req_method("POST") |>
    httr2::req_body_json(list(
      identifier = user,
      password = password
    )) |>
    httr2::req_error(body = error_parse) |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}


get_token <- function(f = NULL) {
  f <- file.path(
    tools::R_user_dir("atrrr", "cache"),
    Sys.getenv("BSKY_TOKEN", unset = "token.rds")
  )

  if (rlang::env_has(the, nms = "bsky_token")) {
    token <- rlang::env_get(the, nm = "bsky_token", I(rlang::hash("musksucks")))
  } else if (file.exists(f)) {
    token <- read_token(f)
  } else if (!is.null(getOption("httr2_mock", NULL))) {
    token <- list(
      valid_until = Sys.time() + 10 ^ 7,
      accessJwt = "testing",
      handle = "testing",
      password = "testing"
    )
  } else {
    token <- auth()
  }

  if (token$valid_until < Sys.time()) {
    token <- auth(password = token$password, token = token, verbose = FALSE, overwrite = TRUE)
  }

  invisible(token)
}


refresh_token <- function(token) {
  # TODO: no clue why this doesn't work
  # https://github.com/bluesky-social/atproto/blob/main/lexicons/com/atproto/server/refreshSession.json
  # httr2::request("https://bsky.social/xrpc/com.atproto.server.refreshSession") |>
  #   httr2::req_method("POST") |>
  #   httr2::req_auth_bearer_token(token = token$accessJwt) |>
  #   httr2::req_body_json(list(
  #     accessJwt = token$accessJwt,
  #     refreshJwt = token$refreshJwt,
  #     handle = token$handle,
  #     did = token$did
  #   )) |>
  #   httr2::req_error(body = error_parse) |>
  #   httr2::req_perform() |>
  #   httr2::resp_body_json()
  req_token(token$handle, token$password)
}


#' @title Print token
#'
#' @description Print a AT token
#'
#' @param x An object of class \code{bsky_token}
#' @param ... not used.
#'
#' @return No return value, called to print the token to screen
#' @export
print.bsky_token <- function(x, ...) {
  cli::cli_h1("Blue Sky token")
  cli::cat_bullet(glue::glue("User: {x$handle}"),
                  background_col = "#0560FF", col = "#F3F9FF"
  )
  cli::cat_bullet(glue::glue("Domain: {x$domain}"),
                  background_col = "#0560FF", col = "#F3F9FF"
  )
  cli::cat_bullet(glue::glue("Valid until: {x$valid_until}"),
                  background_col = "#0560FF", col = "#F3F9FF"
  )
}


read_token <- function(f) {
  httr2::secret_read_rds(f, I(rlang::hash("musksucks")))
}
