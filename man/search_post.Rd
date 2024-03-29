% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/feed.r
\name{search_post}
\alias{search_post}
\alias{search_skeet}
\title{Search Posts}
\usage{
search_post(q, limit = 100L, parse = TRUE, verbose = NULL, .token = NULL)

search_skeet(q, limit = 100L, parse = TRUE, verbose = NULL, .token = NULL)
}
\arguments{
\item{q}{search query. See Details.}

\item{limit}{Maximum number of records to return. For queries with more than
100 results, pagination is used automatically (one request per 100
results). The function stops when the limit is reached, but you will
usually get a few items more than requested.}

\item{parse}{Parse the results or return the original nested object sent by
the server.}

\item{verbose}{Whether to print status messages to the Console
(\code{TRUE}/\code{FALSE}). Package default (when \code{NULL}) is to have
status messages. Can be changed with \code{Sys.setenv(ATR_VERBOSE =
  FALSE)}.}

\item{.token}{If you manage your own tokens, you can supply it here. Usually
\code{NULL} is OK and will automatically load or guide you to generate a
token.}
}
\value{
a data frame (or nested list) of posts
}
\description{
Search Posts
}
\details{
The \href{https://docs.bsky.app/docs/api/app-bsky-feed-search-posts}{API docs} claim that
Lucene query syntax is supported (Boolean operators and brackets for
complex queries). But only a small subset is \href{https://github.com/bluesky-social/indigo/tree/main/cmd/palomar}{actually implemented}:
\itemize{
\item Whitespace is treated as implicit AND, so all words in a query must occur,
but the word order and proximity are ignored.
\item Double quotes indicate exact phrases.
\item \verb{from:<handle>} will filter to results from that account.
\item \code{-} excludes terms (does not seem to be working at the moment).
}

Note that matches can occur anywhere in the skeet, not just the text. For
example, a term can be in the link preview, or alt text of an image.
}
\examples{
\dontrun{
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
}
}
