# Query profile of an actor or actors

Query profile of an actor or actors

## Usage

``` r
get_user_info(actor, parse = TRUE, .token = NULL)
```

## Arguments

- actor:

  user handle(s) to get information for.

- parse:

  Parse the results or return the original nested object sent by the
  server.

- .token:

  If you manage your own tokens, you can supply it here. Usually `NULL`
  is OK and will automatically load or guide you to generate a token.

## Value

a data frame (or nested list) of found actors.

## Details

Note that if you query several actors at once, profiles that do not
(longer) exist will be missing from the results. If you query and
individual actors and the profile is missing, the API will return an
error and a message like "Account has been suspended".

## Examples

``` r
if (FALSE) { # \dontrun{
rstats_user <- search_user("rstats", limit = 2L)
get_user_info(rstats_user$handle)
} # }
```
