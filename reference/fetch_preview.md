# Fetch link preview

Fetch link preview

## Usage

``` r
fetch_preview(uri)
```

## Arguments

- uri:

  URL or URI to fetch preview for.

## Value

list strutured for use as preview_card

## Examples

``` r
if (FALSE) { # \dontrun{
wiki_preview <- fetch_preview("https://en.wikipedia.org/wiki/AT_Protocol")
post_skeet("Do you know the AT Protocol?", preview_card = wiki_preview)
} # }
```
