


#' app_bsky_actor_get_preferences_int
app_bsky_actor_get_preferences_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_actor_get_preferences
#' Get private preferences attached to the account.
#' @export
app_bsky_actor_get_preferences <- function(.token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.actor.getPreferences"),
    query = as.list(all_params)
  ) |>
    app_bsky_actor_get_preferences_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_actor_get_profile_int
app_bsky_actor_get_profile_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_actor_get_profile
#' 
#' @export
app_bsky_actor_get_profile <- function(actor, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.actor.getProfile"),
    query = as.list(all_params)
  ) |>
    app_bsky_actor_get_profile_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_actor_get_profiles_int
app_bsky_actor_get_profiles_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_actor_get_profiles
#' 
#' @export
app_bsky_actor_get_profiles <- function(actors, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.actor.getProfiles"),
    query = as.list(all_params)
  ) |>
    app_bsky_actor_get_profiles_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_actor_get_suggestions_int
app_bsky_actor_get_suggestions_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_actor_get_suggestions
#' Get a list of actors suggested for following. Used in discovery UIs.
#' @export
app_bsky_actor_get_suggestions <- function(limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.actor.getSuggestions"),
    query = as.list(all_params)
  ) |>
    app_bsky_actor_get_suggestions_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_actor_put_preferences_int
app_bsky_actor_put_preferences_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/app.bsky.actor.putPreferences") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' app_bsky_actor_put_preferences
#' Sets the private preferences attached to the account.
#' @export
app_bsky_actor_put_preferences <- function(preferences, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  app_bsky_actor_put_preferences_int(body) |>
    httr2::resp_body_json()
}



#' app_bsky_actor_search_actors_int
app_bsky_actor_search_actors_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_actor_search_actors
#' Find actors (profiles) matching search criteria.
#' @export
app_bsky_actor_search_actors <- function(term = NULL, q = NULL, limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.actor.searchActors"),
    query = as.list(all_params)
  ) |>
    app_bsky_actor_search_actors_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_actor_search_actors_typeahead_int
app_bsky_actor_search_actors_typeahead_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_actor_search_actors_typeahead
#' Find actor suggestions for a search term.
#' @export
app_bsky_actor_search_actors_typeahead <- function(term = NULL, q = NULL, limit = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.actor.searchActorsTypeahead"),
    query = as.list(all_params)
  ) |>
    app_bsky_actor_search_actors_typeahead_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_feed_describe_feed_generator_int
app_bsky_feed_describe_feed_generator_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_feed_describe_feed_generator
#' Returns information about a given feed generator including TOS & offered feed URIs
#' @export
app_bsky_feed_describe_feed_generator <- function(.token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.feed.describeFeedGenerator"),
    query = as.list(all_params)
  ) |>
    app_bsky_feed_describe_feed_generator_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_feed_get_actor_feeds_int
app_bsky_feed_get_actor_feeds_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_feed_get_actor_feeds
#' Retrieve a list of feeds created by a given actor
#' @export
app_bsky_feed_get_actor_feeds <- function(actor, limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.feed.getActorFeeds"),
    query = as.list(all_params)
  ) |>
    app_bsky_feed_get_actor_feeds_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_feed_get_actor_likes_int
app_bsky_feed_get_actor_likes_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_feed_get_actor_likes
#' A view of the posts liked by an actor.
#' @export
app_bsky_feed_get_actor_likes <- function(actor, limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.feed.getActorLikes"),
    query = as.list(all_params)
  ) |>
    app_bsky_feed_get_actor_likes_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_feed_get_author_feed_int
app_bsky_feed_get_author_feed_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_feed_get_author_feed
#' A view of an actor's feed.
#' @export
app_bsky_feed_get_author_feed <- function(actor, limit = NULL, cursor = NULL, filter = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.feed.getAuthorFeed"),
    query = as.list(all_params)
  ) |>
    app_bsky_feed_get_author_feed_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_feed_get_feed_int
app_bsky_feed_get_feed_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_feed_get_feed
#' Compose and hydrate a feed from a user's selected feed generator
#' @export
app_bsky_feed_get_feed <- function(feed, limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.feed.getFeed"),
    query = as.list(all_params)
  ) |>
    app_bsky_feed_get_feed_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_feed_get_feed_generator_int
app_bsky_feed_get_feed_generator_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_feed_get_feed_generator
#' Get information about a specific feed offered by a feed generator, such as its online status
#' @export
app_bsky_feed_get_feed_generator <- function(feed, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.feed.getFeedGenerator"),
    query = as.list(all_params)
  ) |>
    app_bsky_feed_get_feed_generator_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_feed_get_feed_generators_int
app_bsky_feed_get_feed_generators_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_feed_get_feed_generators
#' Get information about a list of feed generators
#' @export
app_bsky_feed_get_feed_generators <- function(feeds, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.feed.getFeedGenerators"),
    query = as.list(all_params)
  ) |>
    app_bsky_feed_get_feed_generators_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_feed_get_feed_skeleton_int
app_bsky_feed_get_feed_skeleton_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_feed_get_feed_skeleton
#' A skeleton of a feed provided by a feed generator
#' @export
app_bsky_feed_get_feed_skeleton <- function(feed, limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.feed.getFeedSkeleton"),
    query = as.list(all_params)
  ) |>
    app_bsky_feed_get_feed_skeleton_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_feed_get_likes_int
app_bsky_feed_get_likes_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_feed_get_likes
#' 
#' @export
app_bsky_feed_get_likes <- function(uri, cid = NULL, limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.feed.getLikes"),
    query = as.list(all_params)
  ) |>
    app_bsky_feed_get_likes_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_feed_get_list_feed_int
app_bsky_feed_get_list_feed_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_feed_get_list_feed
#' A view of a recent posts from actors in a list
#' @export
app_bsky_feed_get_list_feed <- function(list, limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.feed.getListFeed"),
    query = as.list(all_params)
  ) |>
    app_bsky_feed_get_list_feed_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_feed_get_post_thread_int
app_bsky_feed_get_post_thread_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_feed_get_post_thread
#' 
#' @export
app_bsky_feed_get_post_thread <- function(uri, depth = NULL, parentHeight = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.feed.getPostThread"),
    query = as.list(all_params)
  ) |>
    app_bsky_feed_get_post_thread_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_feed_get_posts_int
app_bsky_feed_get_posts_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_feed_get_posts
#' A view of an actor's feed.
#' @export
app_bsky_feed_get_posts <- function(uris, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.feed.getPosts"),
    query = as.list(all_params)
  ) |>
    app_bsky_feed_get_posts_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_feed_get_reposted_by_int
app_bsky_feed_get_reposted_by_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_feed_get_reposted_by
#' 
#' @export
app_bsky_feed_get_reposted_by <- function(uri, cid = NULL, limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.feed.getRepostedBy"),
    query = as.list(all_params)
  ) |>
    app_bsky_feed_get_reposted_by_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_feed_get_suggested_feeds_int
app_bsky_feed_get_suggested_feeds_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_feed_get_suggested_feeds
#' Get a list of suggested feeds for the viewer.
#' @export
app_bsky_feed_get_suggested_feeds <- function(limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.feed.getSuggestedFeeds"),
    query = as.list(all_params)
  ) |>
    app_bsky_feed_get_suggested_feeds_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_feed_get_timeline_int
app_bsky_feed_get_timeline_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_feed_get_timeline
#' A view of the user's home timeline.
#' @export
app_bsky_feed_get_timeline <- function(algorithm = NULL, limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.feed.getTimeline"),
    query = as.list(all_params)
  ) |>
    app_bsky_feed_get_timeline_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_feed_search_posts_int
app_bsky_feed_search_posts_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_feed_search_posts
#' Find posts matching search criteria
#' @export
app_bsky_feed_search_posts <- function(q, limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.feed.searchPosts"),
    query = as.list(all_params)
  ) |>
    app_bsky_feed_search_posts_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_graph_get_blocks_int
app_bsky_graph_get_blocks_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_graph_get_blocks
#' Who is the requester's account blocking?
#' @export
app_bsky_graph_get_blocks <- function(limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.graph.getBlocks"),
    query = as.list(all_params)
  ) |>
    app_bsky_graph_get_blocks_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_graph_get_followers_int
app_bsky_graph_get_followers_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_graph_get_followers
#' Who is following an actor?
#' @export
app_bsky_graph_get_followers <- function(actor, limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.graph.getFollowers"),
    query = as.list(all_params)
  ) |>
    app_bsky_graph_get_followers_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_graph_get_follows_int
app_bsky_graph_get_follows_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_graph_get_follows
#' Who is an actor following?
#' @export
app_bsky_graph_get_follows <- function(actor, limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.graph.getFollows"),
    query = as.list(all_params)
  ) |>
    app_bsky_graph_get_follows_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_graph_get_list_int
app_bsky_graph_get_list_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_graph_get_list
#' Fetch a list of actors
#' @export
app_bsky_graph_get_list <- function(list, limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.graph.getList"),
    query = as.list(all_params)
  ) |>
    app_bsky_graph_get_list_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_graph_get_list_blocks_int
app_bsky_graph_get_list_blocks_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_graph_get_list_blocks
#' Which lists is the requester's account blocking?
#' @export
app_bsky_graph_get_list_blocks <- function(limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.graph.getListBlocks"),
    query = as.list(all_params)
  ) |>
    app_bsky_graph_get_list_blocks_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_graph_get_list_mutes_int
app_bsky_graph_get_list_mutes_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_graph_get_list_mutes
#' Which lists is the requester's account muting?
#' @export
app_bsky_graph_get_list_mutes <- function(limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.graph.getListMutes"),
    query = as.list(all_params)
  ) |>
    app_bsky_graph_get_list_mutes_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_graph_get_lists_int
app_bsky_graph_get_lists_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_graph_get_lists
#' Fetch a list of lists that belong to an actor
#' @export
app_bsky_graph_get_lists <- function(actor, limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.graph.getLists"),
    query = as.list(all_params)
  ) |>
    app_bsky_graph_get_lists_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_graph_get_mutes_int
app_bsky_graph_get_mutes_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_graph_get_mutes
#' Who does the viewer mute?
#' @export
app_bsky_graph_get_mutes <- function(limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.graph.getMutes"),
    query = as.list(all_params)
  ) |>
    app_bsky_graph_get_mutes_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_graph_get_suggested_follows_by_actor_int
app_bsky_graph_get_suggested_follows_by_actor_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_graph_get_suggested_follows_by_actor
#' Get suggested follows related to a given actor.
#' @export
app_bsky_graph_get_suggested_follows_by_actor <- function(actor, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.graph.getSuggestedFollowsByActor"),
    query = as.list(all_params)
  ) |>
    app_bsky_graph_get_suggested_follows_by_actor_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_graph_mute_actor_int
app_bsky_graph_mute_actor_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/app.bsky.graph.muteActor") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' app_bsky_graph_mute_actor
#' Mute an actor by did or handle.
#' @export
app_bsky_graph_mute_actor <- function(actor, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  app_bsky_graph_mute_actor_int(body) |>
    httr2::resp_body_json()
}



#' app_bsky_graph_mute_actor_list_int
app_bsky_graph_mute_actor_list_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/app.bsky.graph.muteActorList") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' app_bsky_graph_mute_actor_list
#' Mute a list of actors.
#' @export
app_bsky_graph_mute_actor_list <- function(list, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  app_bsky_graph_mute_actor_list_int(body) |>
    httr2::resp_body_json()
}



#' app_bsky_graph_unmute_actor_int
app_bsky_graph_unmute_actor_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/app.bsky.graph.unmuteActor") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' app_bsky_graph_unmute_actor
#' Unmute an actor by did or handle.
#' @export
app_bsky_graph_unmute_actor <- function(actor, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  app_bsky_graph_unmute_actor_int(body) |>
    httr2::resp_body_json()
}



#' app_bsky_graph_unmute_actor_list_int
app_bsky_graph_unmute_actor_list_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/app.bsky.graph.unmuteActorList") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' app_bsky_graph_unmute_actor_list
#' Unmute a list of actors.
#' @export
app_bsky_graph_unmute_actor_list <- function(list, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  app_bsky_graph_unmute_actor_list_int(body) |>
    httr2::resp_body_json()
}



#' app_bsky_notification_get_unread_count_int
app_bsky_notification_get_unread_count_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_notification_get_unread_count
#' 
#' @export
app_bsky_notification_get_unread_count <- function(seenAt = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.notification.getUnreadCount"),
    query = as.list(all_params)
  ) |>
    app_bsky_notification_get_unread_count_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_notification_list_notifications_int
app_bsky_notification_list_notifications_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_notification_list_notifications
#' 
#' @export
app_bsky_notification_list_notifications <- function(limit = NULL, cursor = NULL, seenAt = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.notification.listNotifications"),
    query = as.list(all_params)
  ) |>
    app_bsky_notification_list_notifications_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_notification_register_push_int
app_bsky_notification_register_push_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/app.bsky.notification.registerPush") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' app_bsky_notification_register_push
#' Register for push notifications with a service
#' @export
app_bsky_notification_register_push <- function(serviceDid, token, platform, appId, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  app_bsky_notification_register_push_int(body) |>
    httr2::resp_body_json()
}



#' app_bsky_notification_update_seen_int
app_bsky_notification_update_seen_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/app.bsky.notification.updateSeen") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' app_bsky_notification_update_seen
#' Notify server that the user has seen notifications.
#' @export
app_bsky_notification_update_seen <- function(seenAt, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  app_bsky_notification_update_seen_int(body) |>
    httr2::resp_body_json()
}



#' app_bsky_unspecced_get_popular_int
app_bsky_unspecced_get_popular_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_unspecced_get_popular
#' DEPRECATED: will be removed soon, please find a feed generator alternative
#' @export
app_bsky_unspecced_get_popular <- function(includeNsfw = NULL, limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.unspecced.getPopular"),
    query = as.list(all_params)
  ) |>
    app_bsky_unspecced_get_popular_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_unspecced_get_popular_feed_generators_int
app_bsky_unspecced_get_popular_feed_generators_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_unspecced_get_popular_feed_generators
#' An unspecced view of globally popular feed generators
#' @export
app_bsky_unspecced_get_popular_feed_generators <- function(limit = NULL, cursor = NULL, query = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.unspecced.getPopularFeedGenerators"),
    query = as.list(all_params)
  ) |>
    app_bsky_unspecced_get_popular_feed_generators_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_unspecced_get_timeline_skeleton_int
app_bsky_unspecced_get_timeline_skeleton_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_unspecced_get_timeline_skeleton
#' A skeleton of a timeline - UNSPECCED & WILL GO AWAY SOON
#' @export
app_bsky_unspecced_get_timeline_skeleton <- function(limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.unspecced.getTimelineSkeleton"),
    query = as.list(all_params)
  ) |>
    app_bsky_unspecced_get_timeline_skeleton_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_unspecced_search_actors_skeleton_int
app_bsky_unspecced_search_actors_skeleton_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_unspecced_search_actors_skeleton
#' Backend Actors (profile) search, returning only skeleton
#' @export
app_bsky_unspecced_search_actors_skeleton <- function(q, typeahead = NULL, limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.unspecced.searchActorsSkeleton"),
    query = as.list(all_params)
  ) |>
    app_bsky_unspecced_search_actors_skeleton_int(.token) |>
    httr2::resp_body_json()
}



#' app_bsky_unspecced_search_posts_skeleton_int
app_bsky_unspecced_search_posts_skeleton_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' app_bsky_unspecced_search_posts_skeleton
#' Backend Posts search, returning only skeleton
#' @export
app_bsky_unspecced_search_posts_skeleton <- function(q, limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/app.bsky.unspecced.searchPostsSkeleton"),
    query = as.list(all_params)
  ) |>
    app_bsky_unspecced_search_posts_skeleton_int(.token) |>
    httr2::resp_body_json()
}



#' com_atproto_admin_disable_account_invites_int
com_atproto_admin_disable_account_invites_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.admin.disableAccountInvites") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_admin_disable_account_invites
#' Disable an account from receiving new invite codes, but does not invalidate existing codes
#' @export
com_atproto_admin_disable_account_invites <- function(account, note = NULL, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_admin_disable_account_invites_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_admin_disable_invite_codes_int
com_atproto_admin_disable_invite_codes_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.admin.disableInviteCodes") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_admin_disable_invite_codes
#' Disable some set of codes and/or all codes associated with a set of users
#' @export
com_atproto_admin_disable_invite_codes <- function(codes = NULL, accounts = NULL, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_admin_disable_invite_codes_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_admin_enable_account_invites_int
com_atproto_admin_enable_account_invites_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.admin.enableAccountInvites") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_admin_enable_account_invites
#' Re-enable an accounts ability to receive invite codes
#' @export
com_atproto_admin_enable_account_invites <- function(account, note = NULL, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_admin_enable_account_invites_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_admin_get_invite_codes_int
com_atproto_admin_get_invite_codes_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' com_atproto_admin_get_invite_codes
#' Admin view of invite codes
#' @export
com_atproto_admin_get_invite_codes <- function(sort = NULL, limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/com.atproto.admin.getInviteCodes"),
    query = as.list(all_params)
  ) |>
    com_atproto_admin_get_invite_codes_int(.token) |>
    httr2::resp_body_json()
}



#' com_atproto_admin_get_moderation_action_int
com_atproto_admin_get_moderation_action_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' com_atproto_admin_get_moderation_action
#' View details about a moderation action.
#' @export
com_atproto_admin_get_moderation_action <- function(id, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/com.atproto.admin.getModerationAction"),
    query = as.list(all_params)
  ) |>
    com_atproto_admin_get_moderation_action_int(.token) |>
    httr2::resp_body_json()
}



#' com_atproto_admin_get_moderation_actions_int
com_atproto_admin_get_moderation_actions_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' com_atproto_admin_get_moderation_actions
#' List moderation actions related to a subject.
#' @export
com_atproto_admin_get_moderation_actions <- function(subject = NULL, limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/com.atproto.admin.getModerationActions"),
    query = as.list(all_params)
  ) |>
    com_atproto_admin_get_moderation_actions_int(.token) |>
    httr2::resp_body_json()
}



#' com_atproto_admin_get_moderation_report_int
com_atproto_admin_get_moderation_report_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' com_atproto_admin_get_moderation_report
#' View details about a moderation report.
#' @export
com_atproto_admin_get_moderation_report <- function(id, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/com.atproto.admin.getModerationReport"),
    query = as.list(all_params)
  ) |>
    com_atproto_admin_get_moderation_report_int(.token) |>
    httr2::resp_body_json()
}



#' com_atproto_admin_get_moderation_reports_int
com_atproto_admin_get_moderation_reports_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' com_atproto_admin_get_moderation_reports
#' List moderation reports related to a subject.
#' @export
com_atproto_admin_get_moderation_reports <- function(subject = NULL, ignoreSubjects = NULL, actionedBy = NULL, reporters = NULL, resolved = NULL, actionType = NULL, limit = NULL, cursor = NULL, reverse = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/com.atproto.admin.getModerationReports"),
    query = as.list(all_params)
  ) |>
    com_atproto_admin_get_moderation_reports_int(.token) |>
    httr2::resp_body_json()
}



#' com_atproto_admin_get_record_int
com_atproto_admin_get_record_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' com_atproto_admin_get_record
#' View details about a record.
#' @export
com_atproto_admin_get_record <- function(uri, cid = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/com.atproto.admin.getRecord"),
    query = as.list(all_params)
  ) |>
    com_atproto_admin_get_record_int(.token) |>
    httr2::resp_body_json()
}



#' com_atproto_admin_get_repo_int
com_atproto_admin_get_repo_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' com_atproto_admin_get_repo
#' View details about a repository.
#' @export
com_atproto_admin_get_repo <- function(did, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/com.atproto.admin.getRepo"),
    query = as.list(all_params)
  ) |>
    com_atproto_admin_get_repo_int(.token) |>
    httr2::resp_body_json()
}



#' com_atproto_admin_resolve_moderation_reports_int
com_atproto_admin_resolve_moderation_reports_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.admin.resolveModerationReports") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_admin_resolve_moderation_reports
#' Resolve moderation reports by an action.
#' @export
com_atproto_admin_resolve_moderation_reports <- function(actionId, reportIds, createdBy, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_admin_resolve_moderation_reports_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_admin_reverse_moderation_action_int
com_atproto_admin_reverse_moderation_action_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.admin.reverseModerationAction") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_admin_reverse_moderation_action
#' Reverse a moderation action.
#' @export
com_atproto_admin_reverse_moderation_action <- function(id, reason, createdBy, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_admin_reverse_moderation_action_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_admin_search_repos_int
com_atproto_admin_search_repos_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' com_atproto_admin_search_repos
#' Find repositories based on a search term.
#' @export
com_atproto_admin_search_repos <- function(term = NULL, q = NULL, invitedBy = NULL, limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/com.atproto.admin.searchRepos"),
    query = as.list(all_params)
  ) |>
    com_atproto_admin_search_repos_int(.token) |>
    httr2::resp_body_json()
}



#' com_atproto_admin_send_email_int
com_atproto_admin_send_email_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.admin.sendEmail") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_admin_send_email
#' Send email to a user's primary email address
#' @export
com_atproto_admin_send_email <- function(recipientDid, content, subject = NULL, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_admin_send_email_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_admin_take_moderation_action_int
com_atproto_admin_take_moderation_action_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.admin.takeModerationAction") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_admin_take_moderation_action
#' Take a moderation action on a repo.
#' @export
com_atproto_admin_take_moderation_action <- function(action, subject, reason, createdBy, subjectBlobCids = NULL, createLabelVals = NULL, negateLabelVals = NULL, durationInHours = NULL, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_admin_take_moderation_action_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_admin_update_account_email_int
com_atproto_admin_update_account_email_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.admin.updateAccountEmail") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_admin_update_account_email
#' Administrative action to update an account's email
#' @export
com_atproto_admin_update_account_email <- function(account, email, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_admin_update_account_email_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_admin_update_account_handle_int
com_atproto_admin_update_account_handle_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.admin.updateAccountHandle") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_admin_update_account_handle
#' Administrative action to update an account's handle
#' @export
com_atproto_admin_update_account_handle <- function(did, handle, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_admin_update_account_handle_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_identity_resolve_handle_int
com_atproto_identity_resolve_handle_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' com_atproto_identity_resolve_handle
#' Provides the DID of a repo.
#' @export
com_atproto_identity_resolve_handle <- function(handle, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/com.atproto.identity.resolveHandle"),
    query = as.list(all_params)
  ) |>
    com_atproto_identity_resolve_handle_int(.token) |>
    httr2::resp_body_json()
}



#' com_atproto_identity_update_handle_int
com_atproto_identity_update_handle_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.identity.updateHandle") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_identity_update_handle
#' Updates the handle of the account
#' @export
com_atproto_identity_update_handle <- function(handle, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_identity_update_handle_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_label_query_labels_int
com_atproto_label_query_labels_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' com_atproto_label_query_labels
#' Find labels relevant to the provided URI patterns.
#' @export
com_atproto_label_query_labels <- function(uriPatterns, sources = NULL, limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/com.atproto.label.queryLabels"),
    query = as.list(all_params)
  ) |>
    com_atproto_label_query_labels_int(.token) |>
    httr2::resp_body_json()
}



#' com_atproto_moderation_create_report_int
com_atproto_moderation_create_report_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.moderation.createReport") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_moderation_create_report
#' Report a repo or a record.
#' @export
com_atproto_moderation_create_report <- function(reasonType, subject, reason = NULL, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_moderation_create_report_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_repo_apply_writes_int
com_atproto_repo_apply_writes_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.repo.applyWrites") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_repo_apply_writes
#' Apply a batch transaction of creates, updates, and deletes.
#' @export
com_atproto_repo_apply_writes <- function(repo, writes, validate = NULL, swapCommit = NULL, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_repo_apply_writes_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_repo_create_record_int
com_atproto_repo_create_record_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.repo.createRecord") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_repo_create_record
#' Create a new record.
#' @export
com_atproto_repo_create_record <- function(repo, collection, record, rkey = NULL, validate = NULL, swapCommit = NULL, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_repo_create_record_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_repo_delete_record_int
com_atproto_repo_delete_record_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.repo.deleteRecord") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_repo_delete_record
#' Delete a record, or ensure it doesn't exist.
#' @export
com_atproto_repo_delete_record <- function(repo, collection, rkey, swapRecord = NULL, swapCommit = NULL, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_repo_delete_record_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_repo_describe_repo_int
com_atproto_repo_describe_repo_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' com_atproto_repo_describe_repo
#' Get information about the repo, including the list of collections.
#' @export
com_atproto_repo_describe_repo <- function(repo, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/com.atproto.repo.describeRepo"),
    query = as.list(all_params)
  ) |>
    com_atproto_repo_describe_repo_int(.token) |>
    httr2::resp_body_json()
}



#' com_atproto_repo_get_record_int
com_atproto_repo_get_record_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' com_atproto_repo_get_record
#' Get a record.
#' @export
com_atproto_repo_get_record <- function(repo, collection, rkey, cid = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/com.atproto.repo.getRecord"),
    query = as.list(all_params)
  ) |>
    com_atproto_repo_get_record_int(.token) |>
    httr2::resp_body_json()
}



#' com_atproto_repo_list_records_int
com_atproto_repo_list_records_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' com_atproto_repo_list_records
#' List a range of records in a collection.
#' @export
com_atproto_repo_list_records <- function(repo, collection, limit = NULL, cursor = NULL, rkeyStart = NULL, rkeyEnd = NULL, reverse = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/com.atproto.repo.listRecords"),
    query = as.list(all_params)
  ) |>
    com_atproto_repo_list_records_int(.token) |>
    httr2::resp_body_json()
}



#' com_atproto_repo_put_record_int
com_atproto_repo_put_record_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.repo.putRecord") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_repo_put_record
#' Write a record, creating or updating it as needed.
#' @export
com_atproto_repo_put_record <- function(repo, collection, rkey, record, validate = NULL, swapRecord = NULL, swapCommit = NULL, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_repo_put_record_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_repo_upload_blob_int
com_atproto_repo_upload_blob_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.repo.uploadBlob") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_repo_upload_blob
#' Upload a new blob to be added to repo in a later request.
#' @export
com_atproto_repo_upload_blob <- function(.token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_repo_upload_blob_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_server_confirm_email_int
com_atproto_server_confirm_email_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.server.confirmEmail") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_server_confirm_email
#' Confirm an email using a token from com.atproto.server.requestEmailConfirmation.
#' @export
com_atproto_server_confirm_email <- function(email, token, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_server_confirm_email_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_server_create_account_int
com_atproto_server_create_account_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.server.createAccount") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_server_create_account
#' Create an account.
#' @export
com_atproto_server_create_account <- function(email, handle, password, did = NULL, inviteCode = NULL, recoveryKey = NULL, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_server_create_account_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_server_create_app_password_int
com_atproto_server_create_app_password_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.server.createAppPassword") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_server_create_app_password
#' Create an app-specific password.
#' @export
com_atproto_server_create_app_password <- function(name, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_server_create_app_password_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_server_create_invite_code_int
com_atproto_server_create_invite_code_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.server.createInviteCode") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_server_create_invite_code
#' Create an invite code.
#' @export
com_atproto_server_create_invite_code <- function(useCount, forAccount = NULL, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_server_create_invite_code_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_server_create_invite_codes_int
com_atproto_server_create_invite_codes_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.server.createInviteCodes") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_server_create_invite_codes
#' Create an invite code.
#' @export
com_atproto_server_create_invite_codes <- function(codeCount, useCount, forAccounts = NULL, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_server_create_invite_codes_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_server_create_session_int
com_atproto_server_create_session_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.server.createSession") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_server_create_session
#' Create an authentication session.
#' @export
com_atproto_server_create_session <- function(identifier, password, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_server_create_session_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_server_delete_account_int
com_atproto_server_delete_account_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.server.deleteAccount") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_server_delete_account
#' Delete a user account with a token and password.
#' @export
com_atproto_server_delete_account <- function(did, password, token, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_server_delete_account_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_server_delete_session_int
com_atproto_server_delete_session_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.server.deleteSession") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_server_delete_session
#' Delete the current session.
#' @export
com_atproto_server_delete_session <- function(.token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_server_delete_session_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_server_describe_server_int
com_atproto_server_describe_server_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' com_atproto_server_describe_server
#' Get a document describing the service's accounts configuration.
#' @export
com_atproto_server_describe_server <- function(.token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/com.atproto.server.describeServer"),
    query = as.list(all_params)
  ) |>
    com_atproto_server_describe_server_int(.token) |>
    httr2::resp_body_json()
}



#' com_atproto_server_get_account_invite_codes_int
com_atproto_server_get_account_invite_codes_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' com_atproto_server_get_account_invite_codes
#' Get all invite codes for a given account
#' @export
com_atproto_server_get_account_invite_codes <- function(includeUsed = NULL, createAvailable = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/com.atproto.server.getAccountInviteCodes"),
    query = as.list(all_params)
  ) |>
    com_atproto_server_get_account_invite_codes_int(.token) |>
    httr2::resp_body_json()
}



#' com_atproto_server_get_session_int
com_atproto_server_get_session_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' com_atproto_server_get_session
#' Get information about the current session.
#' @export
com_atproto_server_get_session <- function(.token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/com.atproto.server.getSession"),
    query = as.list(all_params)
  ) |>
    com_atproto_server_get_session_int(.token) |>
    httr2::resp_body_json()
}



#' com_atproto_server_list_app_passwords_int
com_atproto_server_list_app_passwords_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' com_atproto_server_list_app_passwords
#' List all app-specific passwords.
#' @export
com_atproto_server_list_app_passwords <- function(.token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/com.atproto.server.listAppPasswords"),
    query = as.list(all_params)
  ) |>
    com_atproto_server_list_app_passwords_int(.token) |>
    httr2::resp_body_json()
}



#' com_atproto_server_refresh_session_int
com_atproto_server_refresh_session_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.server.refreshSession") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_server_refresh_session
#' Refresh an authentication session.
#' @export
com_atproto_server_refresh_session <- function(.token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_server_refresh_session_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_server_request_account_delete_int
com_atproto_server_request_account_delete_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.server.requestAccountDelete") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_server_request_account_delete
#' Initiate a user account deletion via email.
#' @export
com_atproto_server_request_account_delete <- function(.token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_server_request_account_delete_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_server_request_email_confirmation_int
com_atproto_server_request_email_confirmation_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.server.requestEmailConfirmation") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_server_request_email_confirmation
#' Request an email with a code to confirm ownership of email
#' @export
com_atproto_server_request_email_confirmation <- function(.token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_server_request_email_confirmation_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_server_request_email_update_int
com_atproto_server_request_email_update_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.server.requestEmailUpdate") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_server_request_email_update
#' Request a token in order to update email.
#' @export
com_atproto_server_request_email_update <- function(.token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_server_request_email_update_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_server_request_password_reset_int
com_atproto_server_request_password_reset_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.server.requestPasswordReset") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_server_request_password_reset
#' Initiate a user account password reset via email.
#' @export
com_atproto_server_request_password_reset <- function(email, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_server_request_password_reset_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_server_reset_password_int
com_atproto_server_reset_password_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.server.resetPassword") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_server_reset_password
#' Reset a user account password using a token.
#' @export
com_atproto_server_reset_password <- function(token, password, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_server_reset_password_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_server_revoke_app_password_int
com_atproto_server_revoke_app_password_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.server.revokeAppPassword") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_server_revoke_app_password
#' Revoke an app-specific password by name.
#' @export
com_atproto_server_revoke_app_password <- function(name, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_server_revoke_app_password_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_server_update_email_int
com_atproto_server_update_email_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.server.updateEmail") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_server_update_email
#' Update an account's email.
#' @export
com_atproto_server_update_email <- function(email, token = NULL, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_server_update_email_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_sync_get_blob_int
com_atproto_sync_get_blob_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' com_atproto_sync_get_blob
#' Get a blob associated with a given repo.
#' @export
com_atproto_sync_get_blob <- function(did, cid, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/com.atproto.sync.getBlob"),
    query = as.list(all_params)
  ) |>
    com_atproto_sync_get_blob_int(.token) |>
    httr2::resp_body_json()
}



#' com_atproto_sync_get_blocks_int
com_atproto_sync_get_blocks_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' com_atproto_sync_get_blocks
#' Gets blocks from a given repo.
#' @export
com_atproto_sync_get_blocks <- function(did, cids, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/com.atproto.sync.getBlocks"),
    query = as.list(all_params)
  ) |>
    com_atproto_sync_get_blocks_int(.token) |>
    httr2::resp_body_json()
}



#' com_atproto_sync_get_checkout_int
com_atproto_sync_get_checkout_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' com_atproto_sync_get_checkout
#' DEPRECATED - please use com.atproto.sync.getRepo instead
#' @export
com_atproto_sync_get_checkout <- function(did, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/com.atproto.sync.getCheckout"),
    query = as.list(all_params)
  ) |>
    com_atproto_sync_get_checkout_int(.token) |>
    httr2::resp_body_json()
}



#' com_atproto_sync_get_head_int
com_atproto_sync_get_head_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' com_atproto_sync_get_head
#' DEPRECATED - please use com.atproto.sync.getLatestCommit instead
#' @export
com_atproto_sync_get_head <- function(did, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/com.atproto.sync.getHead"),
    query = as.list(all_params)
  ) |>
    com_atproto_sync_get_head_int(.token) |>
    httr2::resp_body_json()
}



#' com_atproto_sync_get_latest_commit_int
com_atproto_sync_get_latest_commit_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' com_atproto_sync_get_latest_commit
#' Gets the current commit CID & revision of the repo.
#' @export
com_atproto_sync_get_latest_commit <- function(did, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/com.atproto.sync.getLatestCommit"),
    query = as.list(all_params)
  ) |>
    com_atproto_sync_get_latest_commit_int(.token) |>
    httr2::resp_body_json()
}



#' com_atproto_sync_get_record_int
com_atproto_sync_get_record_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' com_atproto_sync_get_record
#' Gets blocks needed for existence or non-existence of record.
#' @export
com_atproto_sync_get_record <- function(did, collection, rkey, commit = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/com.atproto.sync.getRecord"),
    query = as.list(all_params)
  ) |>
    com_atproto_sync_get_record_int(.token) |>
    httr2::resp_body_json()
}



#' com_atproto_sync_get_repo_int
com_atproto_sync_get_repo_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' com_atproto_sync_get_repo
#' Gets the did's repo, optionally catching up from a specific revision.
#' @export
com_atproto_sync_get_repo <- function(did, since = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/com.atproto.sync.getRepo"),
    query = as.list(all_params)
  ) |>
    com_atproto_sync_get_repo_int(.token) |>
    httr2::resp_body_json()
}



#' com_atproto_sync_list_blobs_int
com_atproto_sync_list_blobs_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' com_atproto_sync_list_blobs
#' List blob cids since some revision
#' @export
com_atproto_sync_list_blobs <- function(did, since = NULL, limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/com.atproto.sync.listBlobs"),
    query = as.list(all_params)
  ) |>
    com_atproto_sync_list_blobs_int(.token) |>
    httr2::resp_body_json()
}



#' com_atproto_sync_list_repos_int
com_atproto_sync_list_repos_int <- function(all_params, .token){
  all_params |>
    httr2::url_build() |>
    httr2::request() |>
    httr2::req_method('GET') |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_perform()
}

#' com_atproto_sync_list_repos
#' List dids and root cids of hosted repos
#' @export
com_atproto_sync_list_repos <- function(limit = NULL, cursor = NULL, .token = NULL){

  tmp <- match.call(expand.dots = FALSE)
  tmp[[".token"]] <- NULL
  all_params <<- all_params <- flatten_query_params(tmp)

  list(
    scheme = "https",
    hostname = glue::glue("bsky.social/xrpc/com.atproto.sync.listRepos"),
    query = as.list(all_params)
  ) |>
    com_atproto_sync_list_repos_int(.token) |>
    httr2::resp_body_json()
}



#' com_atproto_sync_notify_of_update_int
com_atproto_sync_notify_of_update_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.sync.notifyOfUpdate") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_sync_notify_of_update
#' Notify a crawling service of a recent update. Often when a long break between updates causes the connection with the crawling service to break.
#' @export
com_atproto_sync_notify_of_update <- function(hostname, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_sync_notify_of_update_int(body) |>
    httr2::resp_body_json()
}



#' com_atproto_sync_request_crawl_int
com_atproto_sync_request_crawl_int <- function(body){

  .token <- body[[".token"]]
  body$token <- NULL

  httr2::request("https://bsky.social/xrpc/com.atproto.sync.requestCrawl") |>
    httr2::req_method("POST") |>
    httr2::req_auth_bearer_token(token = .token$accessJwt) |>
    httr2::req_body_json(body) |>
    httr2::req_perform()
}

#' com_atproto_sync_request_crawl
#' Request a service to persistently crawl hosted repos.
#' @export
com_atproto_sync_request_crawl <- function(hostname, .token = NULL){

  body <- as.list(match.call())[-1] %>%
    imap(~getPreferences)

  com_atproto_sync_request_crawl_int(body) |>
    httr2::resp_body_json()
}
