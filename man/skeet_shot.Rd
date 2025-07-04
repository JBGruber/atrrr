% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/skeet_shot.r
\name{skeet_shot}
\alias{skeet_shot}
\title{Take high quality screenshots of skeets}
\usage{
skeet_shot(x, file = NULL, delay = 1, ...)
}
\arguments{
\item{x}{a vector of URLs or URIs.}

\item{file}{output file name. Defaults to the skeet id.}

\item{delay}{time to wait for content to load. Can make sense to increase if
not everything is loaded in the screentshot yet.}

\item{...}{passed on to \link[webshot2]{webshot}.}
}
\value{
path to file
}
\description{
Take high quality screenshots of skeets
}
\examples{
\dontrun{
df <- atrrr::search_post("rstats")
skeet_shot(df$uri[1:2])
}
}
