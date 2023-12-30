# this function records replies from the API in an RDS file and loads the
# response from disk the next time a request is made to the same endpoint.
mocked_record <- function(req) {
  endpoint <- sub("\\?.*", "", basename(req$url))
  f <- paste0(file.path("recorded_responses", endpoint), ".rds")
  if (file.exists(f) && endpoint != "com.atproto.server.createSession") {
    resp <- readRDS(f)
  } else {
    resp <- httr2::req_perform(req, mock = NULL)
    saveRDS(resp, f)
  }
  return(resp)
}

# setting this option makes sure all requests are mocked from here on.
op_mock <- options("httr2_mock" = mocked_record)

# set the package to perform actions quietly during tests.
op_verbose <- options("ATR_VERBOSE" = FALSE)
