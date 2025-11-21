# Get likes/reposts of a skeet

Get likes/reposts of a skeet

## Usage

``` r
get_likes(
  post_url,
  limit = 25L,
  cursor = NULL,
  parse = TRUE,
  verbose = NULL,
  .token = NULL
)

get_reposts(
  post_url,
  limit = 25L,
  cursor = NULL,
  parse = TRUE,
  verbose = NULL,
  .token = NULL
)
```

## Arguments

- post_url:

  the URL of a skeet for which to retrieve who liked/reposted it.

- limit:

  Maximum number of records to return. For queries with more than 100
  results, pagination is used automatically (one request per 100
  results). The function stops when the limit is reached, but you will
  usually get a few items more than requested.

- cursor:

  Cursor for pagination (to pick up an old search).

- parse:

  Parse the results or return the original nested object sent by the
  server.

- verbose:

  Whether to print status messages to the Console (`TRUE`/`FALSE`).
  Package default (when `NULL`) is to have status messages. Can be
  changed with `Sys.setenv(ATR_VERBOSE = FALSE)`.

- .token:

  If you manage your own tokens, you can supply it here. Usually `NULL`
  is OK and will automatically load or guide you to generate a token.

## Value

a data frame (or nested list) of likes/reposts

## Examples

``` r
if (FALSE) { # \dontrun{
get_likes("https://bsky.app/profile/jbgruber.bsky.social/post/3kbi55xm6u62v")
get_reposts("https://bsky.app/profile/jbgruber.bsky.social/post/3kbi55xm6u62v")
} # }
```
