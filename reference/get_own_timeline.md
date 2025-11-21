# Get your own timeline

Get the posts that would be shown when you open the Bluesky app or
website.

## Usage

``` r
get_own_timeline(
  algorithm = NULL,
  limit = 25L,
  cursor = NULL,
  parse = TRUE,
  verbose = NULL,
  .token = NULL
)
```

## Arguments

- algorithm:

  algorithm used to sort the posts

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

a data frame (or nested list) of posts

## Examples

``` r
if (FALSE) { # \dontrun{
get_own_timeline()
get_own_timeline(algorithm = "reverse-chronological")
} # }
```
