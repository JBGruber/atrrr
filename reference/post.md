# Post a skeet

Post a skeet

## Usage

``` r
post(
  text,
  in_reply_to = NULL,
  quote = NULL,
  image = NULL,
  image_alt = NULL,
  video = NULL,
  link = NULL,
  created_at = Sys.time(),
  labels = NULL,
  langs = NULL,
  tags = NULL,
  preview_card = TRUE,
  verbose = NULL,
  .token = NULL
)

post_skeet(
  text,
  in_reply_to = NULL,
  quote = NULL,
  image = NULL,
  image_alt = NULL,
  video = NULL,
  link = NULL,
  created_at = Sys.time(),
  labels = NULL,
  langs = NULL,
  tags = NULL,
  preview_card = TRUE,
  verbose = NULL,
  .token = NULL
)

delete_skeet(post_url, verbose = NULL, .token = NULL)

delete_post(post_url, verbose = NULL, .token = NULL)
```

## Arguments

- text:

  Text to post

- in_reply_to:

  URL or URI of a skeet this should reply to.

- quote:

  URL or URI of a skeet this should quote.

- image, video:

  path to an image or video to post.

- image_alt:

  alt text for the image.

- link:

  instead of adding a link in text (gets parsed automatically), it's
  also possible to add a link directly (and save some characters).

- created_at:

  time stamp of the post.

- labels:

  can be used to label a post, for example "!no-unauthenticated",
  "porn", "sexual", "nudity", or "graphic-media".

- langs:

  indicates human language(s) (up to 3) of post's primary text content.

- tags:

  additional hashtags, in addition to any included in post text and
  facets.

- preview_card:

  display a preview card for links included in the `text` or `link` (if
  images or videos are included, they take precedence).

- verbose:

  Whether to print status messages to the Console (`TRUE`/`FALSE`).
  Package default (when `NULL`) is to have status messages. Can be
  changed with `Sys.setenv(ATR_VERBOSE = FALSE)`.

- .token:

  If you manage your own tokens, you can supply it here. Usually `NULL`
  is OK and will automatically load or guide you to generate a token.

- post_url:

  URL or URI of post to delete.

## Value

list of the URI and CID of the post (invisible)

## Examples

``` r
if (FALSE) { # \dontrun{
post("Hello from #rstats with {atrrr}")
} # }
```
