#' tools_ozone_moderation_emit_event
#' Take a moderation action on an actor.
#' @noRd
tools_ozone_moderation_emit_event <- function(event, subject, createdBy, subjectBlobCids = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/tools.ozone.moderation.emitEvent",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' tools_ozone_moderation_get_event
#' Get details about a moderation event.
#' @noRd
tools_ozone_moderation_get_event <- function(id, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/tools.ozone.moderation.getEvent",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' tools_ozone_moderation_get_record
#' Get details about a record.
#' @noRd
tools_ozone_moderation_get_record <- function(uri, cid = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/tools.ozone.moderation.getRecord",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' tools_ozone_moderation_get_records
#' Get details about some records.
#' @noRd
tools_ozone_moderation_get_records <- function(uris, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/tools.ozone.moderation.getRecords",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' tools_ozone_moderation_get_repo
#' Get details about a repository.
#' @noRd
tools_ozone_moderation_get_repo <- function(did, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/tools.ozone.moderation.getRepo",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' tools_ozone_moderation_get_repos
#' Get details about some repositories.
#' @noRd
tools_ozone_moderation_get_repos <- function(dids, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/tools.ozone.moderation.getRepos",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' tools_ozone_moderation_query_events
#' List moderation events related to a subject.
#' @noRd
tools_ozone_moderation_query_events <- function(types = NULL, createdBy = NULL, sortDirection = NULL, createdAfter = NULL, createdBefore = NULL, subject = NULL, collections = NULL, subjectType = NULL, includeAllUserRecords = NULL, limit = NULL, hasComment = NULL, comment = NULL, addedLabels = NULL, removedLabels = NULL, addedTags = NULL, removedTags = NULL, reportTypes = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/tools.ozone.moderation.queryEvents",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' tools_ozone_moderation_query_statuses
#' View moderation statuses of subjects (record or repo).
#' @noRd
tools_ozone_moderation_query_statuses <- function(includeAllUserRecords = NULL, subject = NULL, comment = NULL, reportedAfter = NULL, reportedBefore = NULL, reviewedAfter = NULL, hostingDeletedAfter = NULL, hostingDeletedBefore = NULL, hostingUpdatedAfter = NULL, hostingUpdatedBefore = NULL, hostingStatuses = NULL, reviewedBefore = NULL, includeMuted = NULL, onlyMuted = NULL, reviewState = NULL, ignoreSubjects = NULL, lastReviewedBy = NULL, sortField = NULL, sortDirection = NULL, takendown = NULL, appealed = NULL, limit = NULL, tags = NULL, excludeTags = NULL, cursor = NULL, collections = NULL, subjectType = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/tools.ozone.moderation.queryStatuses",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' tools_ozone_moderation_search_repos
#' Find repositories based on a search term.
#' @noRd
tools_ozone_moderation_search_repos <- function(term = NULL, q = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    hostname = "bsky.social/xrpc/tools.ozone.moderation.searchRepos",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}
