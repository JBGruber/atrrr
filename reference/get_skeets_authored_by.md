# A view of an actor's skeets.

A view of an actor's skeets.

## Usage

``` r
get_skeets_authored_by(
  actor,
  limit = 25L,
  filter = NULL,
  cursor = NULL,
  parse = TRUE,
  verbose = NULL,
  .token = NULL
)
```

## Arguments

- actor:

  user handle to retrieve feed for.

- limit:

  Maximum number of records to return. For queries with more than 100
  results, pagination is used automatically (one request per 100
  results). The function stops when the limit is reached, but you will
  usually get a few items more than requested.

- filter:

  get only certain post/repost types. Possible values
  "posts_with_replies", "posts_no_replies", "posts_with_media", and
  "posts_and_author_threads".

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
andrews_posts <- get_skeets_authored_by("andrew.heiss.phd")
} # }
```
