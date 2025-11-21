# Get likes of a user

Get likes of a user

## Usage

``` r
get_actor_likes(
  actor,
  limit = 25L,
  cursor = NULL,
  parse = TRUE,
  verbose = NULL,
  .token = NULL
)
```

## Arguments

- actor:

  user handle to retrieve likes for.

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
get_actor_likes("jbgruber.bsky.social")
} # }
```
