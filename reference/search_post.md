# Search Posts

Search Posts

## Usage

``` r
search_post(
  q,
  limit = 100L,
  sort = NULL,
  since = NULL,
  until = NULL,
  mentions = NULL,
  author = NULL,
  lang = NULL,
  domain = NULL,
  url = NULL,
  tag = NULL,
  parse = TRUE,
  verbose = NULL,
  .token = NULL
)

search_skeet(
  q,
  limit = 100L,
  sort = NULL,
  since = NULL,
  until = NULL,
  mentions = NULL,
  author = NULL,
  lang = NULL,
  domain = NULL,
  url = NULL,
  tag = NULL,
  parse = TRUE,
  verbose = NULL,
  .token = NULL
)
```

## Arguments

- q:

  search query. See Details.

- limit:

  Maximum number of records to return. For queries with more than 100
  results, pagination is used automatically (one request per 100
  results). The function stops when the limit is reached, but you will
  usually get a few items more than requested.

- sort:

  string. Specifies the ranking order of results. Possible values are
  "top" or "latest". Defaults to "latest".

- since:

  string. Filter results for posts after the specified datetime
  (inclusive). Can be a date or datetime object or a string that can be
  parsed either.

- until:

  string. Filter results for posts before the specified datetime (not
  inclusive). Can be a date or datetime object or a string that can be
  parsed either.

- mentions:

  string. Filter to posts that mention the given account. Only matches
  rich-text facet mentions.

- author:

  string. Filter to posts authored by the specified account.

- lang:

  string. Filter results to posts in the specified language. Language
  detection is expected to use the post's language field, though the
  server may override detection.

- domain:

  string. Filter results to posts containing URLs (links or embeds)
  pointing to the specified domain. Hostname normalization may apply.

- url:

  string. Filter results to posts containing links or embeds matching
  the specified URL. URL normalization or fuzzy matching may apply.

- tag:

  string. Filter results to posts containing the specified tag
  (hashtag). Do not include the hash (#) prefix. Multiple tags can be
  specified, with results matching all specified tags (logical AND).

- parse:

  Parse the results or return the original nested object sent by the
  server.

- verbose:

  Whether to print status messages to the Console (`TRUE`/`FALSE`).
  Package default (when `NULL`) is to have status messages. Can be
  changed with `Sys.setenv(ATR_VERBOSE = FALSE)`.

- .token:

  If you manage your own tokens, you can supply it here. Usually `NULL`
  is OK and will automatically load or guide you to generate a token.

## Value

a data frame (or nested list) of posts

## Details

The [API
docs](https://docs.bsky.app/docs/api/app-bsky-feed-search-posts) claim
that Lucene query syntax is supported (Boolean operators and brackets
for complex queries). But only a small subset is [actually
implemented](https://github.com/bluesky-social/indigo/tree/main/cmd/palomar):

- Whitespace is treated as implicit AND, so all words in a query must
  occur, but the word order and proximity are ignored.

- Double quotes indicate exact phrases.

- `from:<handle>` will filter to results from that account.

- `-` excludes terms (does not seem to be working at the moment).

Note that matches can occur anywhere in the skeet, not just the text.
For example, a term can be in the link preview, or alt text of an image.

## Examples

``` r
if (FALSE) { # \dontrun{
search_post("rstats")
# finds post with the hashtag rstats AND the word Bluesky somewhere in the
# skeet (ignoring capitalisaion)
search_post("#rstats Bluesky")

# search for the exact phrase "new #rstats package"
search_post("\"new #rstats package\"")
# Use single quotes so you do not need to escape double quotes
search_post('"new #rstats package"')

# only search for skeets from one user
search_post("from:jbgruber.bsky.social #rstats")

# narrow down the search with more parameters
search_post("{atrrr}",
            sort = "top",
            since = "2024-12-05",
            until = "2024-12-07 10:00:00",
            mentions = NULL,
            author = "jbgruber.bsky.social",
            domain = "jbgruber.github.io",
            url = "https://jbgruber.github.io/atrrr",
            tag = "rstats")
} # }
```
