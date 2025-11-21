# Get all replies

Get all replies and replies on replies of a skeet.

## Usage

``` r
get_replies(post_url, .token = NULL)
```

## Arguments

- post_url:

  the URL of a skeet.

- .token:

  If you manage your own tokens, you can supply it here. Usually `NULL`
  is OK and will automatically load or guide you to generate a token.

## Value

a data frame of skeets

## Examples

``` r
if (FALSE) { # \dontrun{
get_replies("https://bsky.app/profile/jbgruber.bsky.social/post/3kbi57u4sys2l")
} # }
```
