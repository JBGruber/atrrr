#' app_bsky_video_get_job_status
#' Get status details for a video processing job.
#' @noRd
app_bsky_video_get_job_status <- function(jobId, .token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.video.getJobStatus",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_video_get_upload_limits
#' Get video upload limits for the authenticated user.
#' @noRd
app_bsky_video_get_upload_limits <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.video.getUploadLimits",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "GET"
  )
}



#' app_bsky_video_upload_video
#' Upload a video to be processed then stored on the PDS.
#' @noRd
app_bsky_video_upload_video <- function(.token = NULL, .return = c("json", "resp")) {
  make_request(
    name = "bsky.social/xrpc/app.bsky.video.uploadVideo",
    params = as.list(match.call())[-1] |>
      purrr::imap(~ {
        eval(.x, envir = parent.frame())
      }),
    req_method = "POST"
  )
}
