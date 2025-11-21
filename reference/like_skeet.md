# Like a skeet

Like a skeet

## Usage

``` r
like_skeet(post_url, verbose = NULL, .token = NULL)

like_post(post_url, verbose = NULL, .token = NULL)
```

## Arguments

- post_url:

  URL or URI of post to delete.

- verbose:

  Whether to print status messages to the Console (`TRUE`/`FALSE`).
  Package default (when `NULL`) is to have status messages. Can be
  changed with `Sys.setenv(ATR_VERBOSE = FALSE)`.

- .token:

  If you manage your own tokens, you can supply it here. Usually `NULL`
  is OK and will automatically load or guide you to generate a token.

## Value

invisible record information from the API

## Examples

``` r
if (FALSE) { # \dontrun{
# like a post
like_skeet("https://bsky.app/profile/jbgruber.bsky.social/post/3lcmymlgxwa2t")

# or feed in the result of some search
johannes_posts <- get_skeets_authored_by("jbgruber.bsky.social")
like_skeet(johannes_posts$uri)
} # }
```
