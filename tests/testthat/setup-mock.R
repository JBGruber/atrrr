# this function records replies from the API in an RDS file and loads the
# response from disk the next time a request is made to the same endpoint.
mocked_record <- function(req) {
  endpoint <- sub("\\?.*", "", basename(req$url))
  f <- paste0(file.path("recorded_responses", endpoint), ".rds")

  if (endpoint == "com.atproto.server.createSession") { # needs password
    resp <- httr2::response(
      status_code = 200,
      method = "POST",
      headers = "Content-Type: application/json"
    )
  } else if (file.exists(f)) {
    resp <- readRDS(f)
  } else {
    resp <- httr2::req_perform(req, mock = NULL)
    saveRDS(resp, f)
  }
  return(resp)
}

# setting this option makes sure all requests are mocked from here on.
options("httr2_mock" = mocked_record)

# set the package to perform actions quietly during tests.
options("ATR_VERBOSE" = FALSE)

# clean up afterwards
if (!dir.exists(tools::R_user_dir("atrrr", "cache"))) {
  on.exit(unlink(tools::R_user_dir("atrrr", "cache"), recursive = TRUE))
}
