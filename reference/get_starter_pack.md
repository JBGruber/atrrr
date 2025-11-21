# Get Starter Pack

Get all info about a starter pack and the users on it.

## Usage

``` r
get_starter_pack(starter_pack, parse = TRUE, .token = NULL)

get_actor_starter_packs(actor, limit = NULL, cursor = NULL, .token = NULL)
```

## Arguments

- starter_pack:

  the URL of a starter pack

- parse:

  Parse the results or return the original nested object sent by the
  server.

- .token:

  If you manage your own tokens, you can supply it here. Usually `NULL`
  is OK and will automatically load or guide you to generate a token.

- actor:

  user handle of account to query for starter packs.

- limit:

  Maximum number of records to return. For queries with more than 100
  results, pagination is used automatically (one request per 100
  results). The function stops when the limit is reached, but you will
  usually get a few items more than requested.

- cursor:

  Cursor for pagination (to pick up an old search).

## Value

a data frame of users and list info

## Examples

``` r
if (FALSE) { # \dontrun{
get_starter_pack("https://bsky.app/starter-pack/sof14g1l.bsky.social/3lbc4bqetfp22")
} # }
```
