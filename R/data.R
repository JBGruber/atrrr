#' AT Protocol Lexicons
#'
#' Available lexicons for the AT Protocol (Authenticated Transfer Protocol)
#'
#' @format ## `list_lexicons`
#' A list with all lexicons available for the AT protocols.
#' \describe{
#'   \item{names}{Name of the lexicon}
#'   \item{values}{path relative to <https://github.com/bluesky-social/atproto/blob/main/lexicons/>}
#' }
#' @source <https://github.com/bluesky-social/atproto>
"list_lexicons"


#' Regular expressions to match mentions and URLs
#'
#' @format ## `regexs`
#' A list with regular expressions to match:
#' \describe{
#'   \item{mention_regex}{Mentions of user handles like @atproto.com}
#'   \item{url_regex}{URLs}
#' }
#' @source <https://atproto.com/blog/create-post#mentions-and-links>
"regexs"
