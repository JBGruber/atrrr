## code to prepare `lexicons` dataset goes here
rel_paths <- github_ls(repo = "https://api.github.com/repos/bluesky-social/atproto/contents",
                       folder = "lexicons")
lexicons <- sub("lexicons", "", rel_paths, fixed = TRUE)
names(lexicons) <- basename(lexicons) |>
  tools::file_path_sans_ext()

lexicons <- as.list(lexicons)

usethis::use_data(list_lexicons, overwrite = TRUE)
