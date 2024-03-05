# this function records replies from the API in an RDS file and loads the
# response from disk the next time a request is made to the same endpoint.
mocked_record <- function(req) {
  req <<- req
  # to identify requests, we use a combination of endpoint and request data
  endpoint <- sub("\\?.*", "", basename(req$url))
  dat <- req$body$data
  if (is.null(dat)) { # when data is sent as URL parameters
    dat <- sub(endpoint, "", basename(req$url))
  }
  data_hash <- rlang::hash(dat) |>
    substr(1, 5) # check complains about long file names
  f <- file.path("recorded_responses", paste0(endpoint,
                        "_", data_hash, ".rds"))

  if (endpoint == "com.atproto.server.createSession") { # needs password
    resp <- httr2::response(
      status_code = 200,
      method = "POST",
      headers = "Content-Type: application/json"
    )
    # for everything but session, see if req has been made
  } else if (file.exists(f)) {
    resp <- readRDS(f)
  } else { # if not, make request, record response
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
