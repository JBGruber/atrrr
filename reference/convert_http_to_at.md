# Converts betweet http URL and AT URI

Converts betweet http URL and AT URI

## Usage

``` r
convert_http_to_at(link, .token = NULL)

convert_at_to_http(link)
```

## Arguments

- link:

  either an AT or HTTP link.

- .token:

  If you manage your own tokens, you can supply it here. Usually `NULL`
  is OK and will automatically load or guide you to generate a token.

## Value

either an AT or HTTP link

## Details

The AT protocol uses a different scheme to link to posts, useser, feeds
etc. Instead of the common https:// link format, internally a links
starting with at:// are used (see
<https://atproto.com/specs/at-uri-scheme> for details). The functions
convert links from the HTTP to the AT format, or the other way around.
This is useful if you want to use a link in a browser.

## Examples

``` r
if (FALSE) { # \dontrun{
convert_http_to_at("https://bsky.app/profile/benguinaudeau.bsky.social/post/3kbi5v7oncq25")
convert_at_to_http("at://did:plc:vuvsifrusnjsys7mhkpk662u/app.bsky.feed.post/3kbi5v7oncq25")
} # }
```
