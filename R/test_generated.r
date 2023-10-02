



#' app_bsky_actor_get_preferences
#' Get private preferences attached to the account.
#' @export
app_bsky_actor_get_preferences <- function(.token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.actor.getPreferences",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_actor_get_profile
#' 
#' @export
app_bsky_actor_get_profile <- function(actor, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.actor.getProfile",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_actor_get_profiles
#' 
#' @export
app_bsky_actor_get_profiles <- function(actors, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.actor.getProfiles",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_actor_get_suggestions
#' Get a list of actors suggested for following. Used in discovery UIs.
#' @export
app_bsky_actor_get_suggestions <- function(limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.actor.getSuggestions",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_actor_put_preferences
#' Sets the private preferences attached to the account.
#' @export
app_bsky_actor_put_preferences <- function(preferences, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.actor.putPreferences",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' app_bsky_actor_search_actors
#' Find actors (profiles) matching search criteria.
#' @export
app_bsky_actor_search_actors <- function(term = NULL, q = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.actor.searchActors",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_actor_search_actors_typeahead
#' Find actor suggestions for a search term.
#' @export
app_bsky_actor_search_actors_typeahead <- function(term = NULL, q = NULL, limit = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.actor.searchActorsTypeahead",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_feed_describe_feed_generator
#' Returns information about a given feed generator including TOS & offered feed URIs
#' @export
app_bsky_feed_describe_feed_generator <- function(.token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.describeFeedGenerator",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_feed_get_actor_feeds
#' Retrieve a list of feeds created by a given actor
#' @export
app_bsky_feed_get_actor_feeds <- function(actor, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.getActorFeeds",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_feed_get_actor_likes
#' A view of the posts liked by an actor.
#' @export
app_bsky_feed_get_actor_likes <- function(actor, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.getActorLikes",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_feed_get_author_feed
#' A view of an actor's feed.
#' @export
app_bsky_feed_get_author_feed <- function(actor, limit = NULL, cursor = NULL, filter = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.getAuthorFeed",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_feed_get_feed
#' Compose and hydrate a feed from a user's selected feed generator
#' @export
app_bsky_feed_get_feed <- function(feed, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.getFeed",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_feed_get_feed_generator
#' Get information about a specific feed offered by a feed generator, such as its online status
#' @export
app_bsky_feed_get_feed_generator <- function(feed, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.getFeedGenerator",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_feed_get_feed_generators
#' Get information about a list of feed generators
#' @export
app_bsky_feed_get_feed_generators <- function(feeds, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.getFeedGenerators",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_feed_get_feed_skeleton
#' A skeleton of a feed provided by a feed generator
#' @export
app_bsky_feed_get_feed_skeleton <- function(feed, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.getFeedSkeleton",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_feed_get_likes
#' 
#' @export
app_bsky_feed_get_likes <- function(uri, cid = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.getLikes",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_feed_get_list_feed
#' A view of a recent posts from actors in a list
#' @export
app_bsky_feed_get_list_feed <- function(list, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.getListFeed",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_feed_get_post_thread
#' 
#' @export
app_bsky_feed_get_post_thread <- function(uri, depth = NULL, parentHeight = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.getPostThread",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_feed_get_posts
#' A view of an actor's feed.
#' @export
app_bsky_feed_get_posts <- function(uris, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.getPosts",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_feed_get_reposted_by
#' 
#' @export
app_bsky_feed_get_reposted_by <- function(uri, cid = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.getRepostedBy",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_feed_get_suggested_feeds
#' Get a list of suggested feeds for the viewer.
#' @export
app_bsky_feed_get_suggested_feeds <- function(limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.getSuggestedFeeds",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_feed_get_timeline
#' A view of the user's home timeline.
#' @export
app_bsky_feed_get_timeline <- function(algorithm = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.getTimeline",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_feed_search_posts
#' Find posts matching search criteria
#' @export
app_bsky_feed_search_posts <- function(q, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.feed.searchPosts",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_graph_get_blocks
#' Who is the requester's account blocking?
#' @export
app_bsky_graph_get_blocks <- function(limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.getBlocks",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_graph_get_followers
#' Who is following an actor?
#' @export
app_bsky_graph_get_followers <- function(actor, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.getFollowers",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_graph_get_follows
#' Who is an actor following?
#' @export
app_bsky_graph_get_follows <- function(actor, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.getFollows",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_graph_get_list
#' Fetch a list of actors
#' @export
app_bsky_graph_get_list <- function(list, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.getList",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_graph_get_list_blocks
#' Which lists is the requester's account blocking?
#' @export
app_bsky_graph_get_list_blocks <- function(limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.getListBlocks",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_graph_get_list_mutes
#' Which lists is the requester's account muting?
#' @export
app_bsky_graph_get_list_mutes <- function(limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.getListMutes",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_graph_get_lists
#' Fetch a list of lists that belong to an actor
#' @export
app_bsky_graph_get_lists <- function(actor, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.getLists",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_graph_get_mutes
#' Who does the viewer mute?
#' @export
app_bsky_graph_get_mutes <- function(limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.getMutes",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_graph_get_suggested_follows_by_actor
#' Get suggested follows related to a given actor.
#' @export
app_bsky_graph_get_suggested_follows_by_actor <- function(actor, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.getSuggestedFollowsByActor",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_graph_mute_actor
#' Mute an actor by did or handle.
#' @export
app_bsky_graph_mute_actor <- function(actor, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.muteActor",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' app_bsky_graph_mute_actor_list
#' Mute a list of actors.
#' @export
app_bsky_graph_mute_actor_list <- function(list, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.muteActorList",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' app_bsky_graph_unmute_actor
#' Unmute an actor by did or handle.
#' @export
app_bsky_graph_unmute_actor <- function(actor, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.unmuteActor",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' app_bsky_graph_unmute_actor_list
#' Unmute a list of actors.
#' @export
app_bsky_graph_unmute_actor_list <- function(list, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.graph.unmuteActorList",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' app_bsky_notification_get_unread_count
#' 
#' @export
app_bsky_notification_get_unread_count <- function(seenAt = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.notification.getUnreadCount",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_notification_list_notifications
#' 
#' @export
app_bsky_notification_list_notifications <- function(limit = NULL, cursor = NULL, seenAt = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.notification.listNotifications",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_notification_register_push
#' Register for push notifications with a service
#' @export
app_bsky_notification_register_push <- function(serviceDid, token, platform, appId, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.notification.registerPush",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' app_bsky_notification_update_seen
#' Notify server that the user has seen notifications.
#' @export
app_bsky_notification_update_seen <- function(seenAt, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.notification.updateSeen",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' app_bsky_unspecced_get_popular
#' DEPRECATED: will be removed soon, please find a feed generator alternative
#' @export
app_bsky_unspecced_get_popular <- function(includeNsfw = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.unspecced.getPopular",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_unspecced_get_popular_feed_generators
#' An unspecced view of globally popular feed generators
#' @export
app_bsky_unspecced_get_popular_feed_generators <- function(limit = NULL, cursor = NULL, query = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.unspecced.getPopularFeedGenerators",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_unspecced_get_timeline_skeleton
#' A skeleton of a timeline - UNSPECCED & WILL GO AWAY SOON
#' @export
app_bsky_unspecced_get_timeline_skeleton <- function(limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.unspecced.getTimelineSkeleton",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_unspecced_search_actors_skeleton
#' Backend Actors (profile) search, returning only skeleton
#' @export
app_bsky_unspecced_search_actors_skeleton <- function(q, typeahead = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.unspecced.searchActorsSkeleton",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' app_bsky_unspecced_search_posts_skeleton
#' Backend Posts search, returning only skeleton
#' @export
app_bsky_unspecced_search_posts_skeleton <- function(q, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/app.bsky.unspecced.searchPostsSkeleton",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' com_atproto_admin_disable_account_invites
#' Disable an account from receiving new invite codes, but does not invalidate existing codes
#' @export
com_atproto_admin_disable_account_invites <- function(account, note = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.disableAccountInvites",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_admin_disable_invite_codes
#' Disable some set of codes and/or all codes associated with a set of users
#' @export
com_atproto_admin_disable_invite_codes <- function(codes = NULL, accounts = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.disableInviteCodes",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_admin_enable_account_invites
#' Re-enable an accounts ability to receive invite codes
#' @export
com_atproto_admin_enable_account_invites <- function(account, note = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.enableAccountInvites",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_admin_get_invite_codes
#' Admin view of invite codes
#' @export
com_atproto_admin_get_invite_codes <- function(sort = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.getInviteCodes",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' com_atproto_admin_get_moderation_action
#' View details about a moderation action.
#' @export
com_atproto_admin_get_moderation_action <- function(id, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.getModerationAction",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' com_atproto_admin_get_moderation_actions
#' List moderation actions related to a subject.
#' @export
com_atproto_admin_get_moderation_actions <- function(subject = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.getModerationActions",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' com_atproto_admin_get_moderation_report
#' View details about a moderation report.
#' @export
com_atproto_admin_get_moderation_report <- function(id, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.getModerationReport",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' com_atproto_admin_get_moderation_reports
#' List moderation reports related to a subject.
#' @export
com_atproto_admin_get_moderation_reports <- function(subject = NULL, ignoreSubjects = NULL, actionedBy = NULL, reporters = NULL, resolved = NULL, actionType = NULL, limit = NULL, cursor = NULL, reverse = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.getModerationReports",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' com_atproto_admin_get_record
#' View details about a record.
#' @export
com_atproto_admin_get_record <- function(uri, cid = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.getRecord",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' com_atproto_admin_get_repo
#' View details about a repository.
#' @export
com_atproto_admin_get_repo <- function(did, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.getRepo",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' com_atproto_admin_resolve_moderation_reports
#' Resolve moderation reports by an action.
#' @export
com_atproto_admin_resolve_moderation_reports <- function(actionId, reportIds, createdBy, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.resolveModerationReports",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_admin_reverse_moderation_action
#' Reverse a moderation action.
#' @export
com_atproto_admin_reverse_moderation_action <- function(id, reason, createdBy, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.reverseModerationAction",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_admin_search_repos
#' Find repositories based on a search term.
#' @export
com_atproto_admin_search_repos <- function(term = NULL, q = NULL, invitedBy = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.searchRepos",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' com_atproto_admin_send_email
#' Send email to a user's primary email address
#' @export
com_atproto_admin_send_email <- function(recipientDid, content, subject = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.sendEmail",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_admin_take_moderation_action
#' Take a moderation action on a repo.
#' @export
com_atproto_admin_take_moderation_action <- function(action, subject, reason, createdBy, subjectBlobCids = NULL, createLabelVals = NULL, negateLabelVals = NULL, durationInHours = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.takeModerationAction",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_admin_update_account_email
#' Administrative action to update an account's email
#' @export
com_atproto_admin_update_account_email <- function(account, email, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.updateAccountEmail",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_admin_update_account_handle
#' Administrative action to update an account's handle
#' @export
com_atproto_admin_update_account_handle <- function(did, handle, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.admin.updateAccountHandle",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_identity_resolve_handle
#' Provides the DID of a repo.
#' @export
com_atproto_identity_resolve_handle <- function(handle, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.identity.resolveHandle",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' com_atproto_identity_update_handle
#' Updates the handle of the account
#' @export
com_atproto_identity_update_handle <- function(handle, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.identity.updateHandle",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_label_query_labels
#' Find labels relevant to the provided URI patterns.
#' @export
com_atproto_label_query_labels <- function(uriPatterns, sources = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.label.queryLabels",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' com_atproto_moderation_create_report
#' Report a repo or a record.
#' @export
com_atproto_moderation_create_report <- function(reasonType, subject, reason = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.moderation.createReport",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_repo_apply_writes
#' Apply a batch transaction of creates, updates, and deletes.
#' @export
com_atproto_repo_apply_writes <- function(repo, writes, validate = NULL, swapCommit = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.repo.applyWrites",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_repo_create_record
#' Create a new record.
#' @export
com_atproto_repo_create_record <- function(repo, collection, record, rkey = NULL, validate = NULL, swapCommit = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.repo.createRecord",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_repo_delete_record
#' Delete a record, or ensure it doesn't exist.
#' @export
com_atproto_repo_delete_record <- function(repo, collection, rkey, swapRecord = NULL, swapCommit = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.repo.deleteRecord",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_repo_describe_repo
#' Get information about the repo, including the list of collections.
#' @export
com_atproto_repo_describe_repo <- function(repo, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.repo.describeRepo",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' com_atproto_repo_get_record
#' Get a record.
#' @export
com_atproto_repo_get_record <- function(repo, collection, rkey, cid = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.repo.getRecord",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' com_atproto_repo_list_records
#' List a range of records in a collection.
#' @export
com_atproto_repo_list_records <- function(repo, collection, limit = NULL, cursor = NULL, rkeyStart = NULL, rkeyEnd = NULL, reverse = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.repo.listRecords",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' com_atproto_repo_put_record
#' Write a record, creating or updating it as needed.
#' @export
com_atproto_repo_put_record <- function(repo, collection, rkey, record, validate = NULL, swapRecord = NULL, swapCommit = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.repo.putRecord",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_repo_upload_blob
#' Upload a new blob to be added to repo in a later request.
#' @export
com_atproto_repo_upload_blob <- function(.token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.repo.uploadBlob",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_server_confirm_email
#' Confirm an email using a token from com.atproto.server.requestEmailConfirmation.
#' @export
com_atproto_server_confirm_email <- function(email, token, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.confirmEmail",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_server_create_account
#' Create an account.
#' @export
com_atproto_server_create_account <- function(email, handle, password, did = NULL, inviteCode = NULL, recoveryKey = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.createAccount",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_server_create_app_password
#' Create an app-specific password.
#' @export
com_atproto_server_create_app_password <- function(name, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.createAppPassword",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_server_create_invite_code
#' Create an invite code.
#' @export
com_atproto_server_create_invite_code <- function(useCount, forAccount = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.createInviteCode",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_server_create_invite_codes
#' Create an invite code.
#' @export
com_atproto_server_create_invite_codes <- function(codeCount, useCount, forAccounts = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.createInviteCodes",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_server_create_session
#' Create an authentication session.
#' @export
com_atproto_server_create_session <- function(identifier, password, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.createSession",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_server_delete_account
#' Delete a user account with a token and password.
#' @export
com_atproto_server_delete_account <- function(did, password, token, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.deleteAccount",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_server_delete_session
#' Delete the current session.
#' @export
com_atproto_server_delete_session <- function(.token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.deleteSession",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_server_describe_server
#' Get a document describing the service's accounts configuration.
#' @export
com_atproto_server_describe_server <- function(.token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.describeServer",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' com_atproto_server_get_account_invite_codes
#' Get all invite codes for a given account
#' @export
com_atproto_server_get_account_invite_codes <- function(includeUsed = NULL, createAvailable = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.getAccountInviteCodes",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' com_atproto_server_get_session
#' Get information about the current session.
#' @export
com_atproto_server_get_session <- function(.token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.getSession",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' com_atproto_server_list_app_passwords
#' List all app-specific passwords.
#' @export
com_atproto_server_list_app_passwords <- function(.token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.listAppPasswords",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' com_atproto_server_refresh_session
#' Refresh an authentication session.
#' @export
com_atproto_server_refresh_session <- function(.token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.refreshSession",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_server_request_account_delete
#' Initiate a user account deletion via email.
#' @export
com_atproto_server_request_account_delete <- function(.token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.requestAccountDelete",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_server_request_email_confirmation
#' Request an email with a code to confirm ownership of email
#' @export
com_atproto_server_request_email_confirmation <- function(.token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.requestEmailConfirmation",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_server_request_email_update
#' Request a token in order to update email.
#' @export
com_atproto_server_request_email_update <- function(.token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.requestEmailUpdate",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_server_request_password_reset
#' Initiate a user account password reset via email.
#' @export
com_atproto_server_request_password_reset <- function(email, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.requestPasswordReset",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_server_reset_password
#' Reset a user account password using a token.
#' @export
com_atproto_server_reset_password <- function(token, password, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.resetPassword",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_server_revoke_app_password
#' Revoke an app-specific password by name.
#' @export
com_atproto_server_revoke_app_password <- function(name, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.revokeAppPassword",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_server_update_email
#' Update an account's email.
#' @export
com_atproto_server_update_email <- function(email, token = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.server.updateEmail",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_sync_get_blob
#' Get a blob associated with a given repo.
#' @export
com_atproto_sync_get_blob <- function(did, cid, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.sync.getBlob",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' com_atproto_sync_get_blocks
#' Gets blocks from a given repo.
#' @export
com_atproto_sync_get_blocks <- function(did, cids, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.sync.getBlocks",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' com_atproto_sync_get_checkout
#' DEPRECATED - please use com.atproto.sync.getRepo instead
#' @export
com_atproto_sync_get_checkout <- function(did, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.sync.getCheckout",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' com_atproto_sync_get_head
#' DEPRECATED - please use com.atproto.sync.getLatestCommit instead
#' @export
com_atproto_sync_get_head <- function(did, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.sync.getHead",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' com_atproto_sync_get_latest_commit
#' Gets the current commit CID & revision of the repo.
#' @export
com_atproto_sync_get_latest_commit <- function(did, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.sync.getLatestCommit",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' com_atproto_sync_get_record
#' Gets blocks needed for existence or non-existence of record.
#' @export
com_atproto_sync_get_record <- function(did, collection, rkey, commit = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.sync.getRecord",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' com_atproto_sync_get_repo
#' Gets the did's repo, optionally catching up from a specific revision.
#' @export
com_atproto_sync_get_repo <- function(did, since = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.sync.getRepo",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' com_atproto_sync_list_blobs
#' List blob cids since some revision
#' @export
com_atproto_sync_list_blobs <- function(did, since = NULL, limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.sync.listBlobs",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' com_atproto_sync_list_repos
#' List dids and root cids of hosted repos
#' @export
com_atproto_sync_list_repos <- function(limit = NULL, cursor = NULL, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.sync.listRepos",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "GET"
  )

}



#' com_atproto_sync_notify_of_update
#' Notify a crawling service of a recent update. Often when a long break between updates causes the connection with the crawling service to break.
#' @export
com_atproto_sync_notify_of_update <- function(hostname, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.sync.notifyOfUpdate",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}



#' com_atproto_sync_request_crawl
#' Request a service to persistently crawl hosted repos.
#' @export
com_atproto_sync_request_crawl <- function(hostname, .token = NULL, .return = c("json", "resp")){

  make_request(
    hostname = "bsky.social/xrpc/com.atproto.sync.requestCrawl",
    params = as.list(match.call())[-1] %>%
      imap(~{eval(.x, envir = parent.frame())}),
    req_method = "POST"
  )

}
