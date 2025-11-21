# Get all skeets in a thread

Retrieve all skeets in a thread (all replies to an original skeet by any
author). It does not matter if you use the original skeet or any reply
as `post_url`.

## Usage

``` r
get_thread(post_url, .token = NULL)
```

## Arguments

- post_url:

  the URL of any skeet in a thread.

- .token:

  If you manage your own tokens, you can supply it here. Usually `NULL`
  is OK and will automatically load or guide you to generate a token.

## Value

a data frame of skeets

## Examples

``` r
if (FALSE) { # \dontrun{
get_thread("https://bsky.app/profile/jbgruber.bsky.social/post/3kbi57u4sys2l")
} # }
```
