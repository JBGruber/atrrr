# Get List

Get a feed of recent posts from a list (posts and reposts from any
actors on the list).

## Usage

``` r
get_list(
  list,
  limit = 25,
  cursor = NULL,
  parse = TRUE,
  verbose = NULL,
  .token = NULL
)

get_list_feed(
  list,
  limit = 25,
  cursor = NULL,
  parse = TRUE,
  verbose = NULL,
  .token = NULL
)
```

## Arguments

- list:

  The url of the requested list

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
# use the URL of a list to get users on the list
get_list("https://bsky.app/profile/smachlis.bsky.social/lists/3l7o5d7b7nl2q")

# or the feed of that list
get_list_feed("https://bsky.app/profile/smachlis.bsky.social/lists/3l7o5d7b7nl2q")
} # }
```
