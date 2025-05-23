% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lists.r
\name{get_starter_pack}
\alias{get_starter_pack}
\alias{get_actor_starter_packs}
\title{Get Starter Pack}
\usage{
get_starter_pack(starter_pack, parse = TRUE, .token = NULL)

get_actor_starter_packs(actor, limit = NULL, cursor = NULL, .token = NULL)
}
\arguments{
\item{starter_pack}{the URL of a starter pack}

\item{parse}{Parse the results or return the original nested object sent by
the server.}

\item{.token}{If you manage your own tokens, you can supply it here. Usually
\code{NULL} is OK and will automatically load or guide you to generate a
token.}

\item{actor}{user handle of account to query for starter packs.}

\item{limit}{Maximum number of records to return. For queries with more than
100 results, pagination is used automatically (one request per 100
results). The function stops when the limit is reached, but you will
usually get a few items more than requested.}

\item{cursor}{Cursor for pagination (to pick up an old search).}
}
\value{
a data frame of users and list info
}
\description{
Get all info about a starter pack and the users on it.
}
\examples{
\dontrun{
get_starter_pack("https://bsky.app/starter-pack/sof14g1l.bsky.social/3lbc4bqetfp22")
}
}
