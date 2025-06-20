#' tools_ozone_team_add_member
#' Add a member to the ozone team. Requires admin role.
#' @noRd
tools_ozone_team_add_member <- function(did, role, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/tools.ozone.team.addMember",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' tools_ozone_team_delete_member
#' Delete a member from ozone team. Requires admin role.
#' @noRd
tools_ozone_team_delete_member <- function(did, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/tools.ozone.team.deleteMember",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}



#' tools_ozone_team_list_members
#' List all members with access to the ozone service.
#' @noRd
tools_ozone_team_list_members <- function(q = NULL, disabled = NULL, roles = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/tools.ozone.team.listMembers",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' tools_ozone_team_update_member
#' Update a member in the ozone service. Requires admin role.
#' @noRd
tools_ozone_team_update_member <- function(did, disabled = NULL, role = NULL, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/tools.ozone.team.updateMember",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}
