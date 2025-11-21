# Authenticate for the API

Run authentication for a network using the AT protocol (e.g., ['Blue
Sky'](https://bsky.app/)) and save the token permanently.

## Usage

``` r
auth(
  user,
  password,
  domain = "https://bsky.app/",
  verbose = TRUE,
  overwrite = FALSE,
  token = NULL
)
```

## Arguments

- user:

  Your user handle (e.g, benguinaudeau.bsky.social).

- password:

  Your app password (usually created on
  <https://bsky.app/settings/app-passwords>).

- domain:

  For now https://bsky.app/, but could change in the future.

- verbose:

  Whether to print status messages to the Console (`TRUE`/`FALSE`).
  Package default (when `NULL`) is to have status messages. Can be
  changed with `Sys.setenv(ATR_VERBOSE = FALSE)`.

- overwrite:

  If TRUE, overwrites old token without asking for confirmation.

- token:

  (Stale) token object. Usually you don't need to use this. But if you
  manage your own tokens and they get stale, you can use this parameter
  and request a fresh token.

## Value

An authentication token (invisible)

## Details

After requesting the token, it is saved in the location returned by
`file.path(tools::R_user_dir("atrrr", "cache"), Sys.getenv("BSKY_TOKEN", unset = "token.rds"))`.
If you have multiple tokens, you can use
`Sys.setenv(BSKY_TOKEN = "filename.rds")` to save/load the token with a
different name.

## Examples

``` r
if (FALSE) { # \dontrun{
# request a token
auth() # this will guide you through all steps

# the token is stored in the location returned by this command
file.path(tools::R_user_dir("atrrr", "cache"),
          Sys.getenv("BSKY_TOKEN", unset = "token.rds"))

# to use a different than the default file name for the token, set BSKY_TOKEN
Sys.setenv(BSKY_TOKEN = "identity-2.rds")

# now either rename your token file or request a new token
auth()

# the cache now contains two tokens
list.files(tools::R_user_dir("atrrr", "cache"))

# functions that interact with the API also take a .token argument with the
# path. For example:
tok_path <- file.path(tools::R_user_dir("atrrr", "cache"), "identity-2.rds")
get_skeets_authored_by(actor = "benguinaudeau.bsky.social", parse = TRUE,
                       .token = tok_path)
} # }
```
