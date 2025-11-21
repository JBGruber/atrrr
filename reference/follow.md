# Un/Follow an account

Un/Follow an account

## Usage

``` r
follow(actor, verbose = NULL, .token = NULL)

unfollow(actor, verbose = NULL, .token = NULL)
```

## Arguments

- actor:

  User handle to follow or unfollow

- verbose:

  Whether to print status messages to the Console (`TRUE`/`FALSE`).
  Package default (when `NULL`) is to have status messages. Can be
  changed with `Sys.setenv(ATR_VERBOSE = FALSE)`.

- .token:

  If you manage your own tokens, you can supply it here. Usually `NULL`
  is OK and will automatically load or guide you to generate a token.

## Value

list with URI and CID of the record (invisible).

## Details

You can only unfollow accounts which you also followed through the
API/the package.

## Examples

``` r
if (FALSE) { # \dontrun{
# follow our test account
follow("atpr.bsky.social")

# unfollow our test account
unfollow("atpr.bsky.social")
} # }
```
