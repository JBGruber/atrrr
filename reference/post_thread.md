# Post a thread

Post a thread

## Usage

``` r
post_thread(
  texts,
  images = NULL,
  image_alts = NULL,
  thread_df = NULL,
  verbose = NULL,
  .token = NULL
)
```

## Arguments

- texts:

  a vector of skeet (post) texts

- images:

  paths to images to be included in each post. This may be a character
  vector, or a list of character vectors if multiple images per post are
  required.

- image_alts:

  alt texts for the images to be included in each post. If images is a
  list of character vectors, this should also be a list of character
  vectors and have the same shape.

- thread_df:

  instead of defining texts, images and image_alts, you can also create
  a data frame with the information in columns of the same names.

- verbose:

  Whether to print status messages to the Console (`TRUE`/`FALSE`).
  Package default (when `NULL`) is to have status messages. Can be
  changed with `Sys.setenv(ATR_VERBOSE = FALSE)`.

- .token:

  If you manage your own tokens, you can supply it here. Usually `NULL`
  is OK and will automatically load or guide you to generate a token.

## Value

list of the URIs and CIDs of the posts (invisible)

## Examples

``` r
if (FALSE) { # \dontrun{
# post three messages in a thread
thread <- post_thread(c("Post 1", "Post 2", "Post 3"))

# delete the thread
delete_post(thread$uri)
} # }
```
