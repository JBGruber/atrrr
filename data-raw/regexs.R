## code to prepare `regexs` dataset goes here
## copied and adapted from https://atproto.com/blog/create-post#mentions-and-links
regexs <- list(
  # original: rb"[$|\W](@([a-zA-Z0-9]([a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]([a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)"
  mention_regex = "[$|\\W]@(([a-zA-Z0-9]([a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?\\.)+[a-zA-Z]([a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)",
  # original: rb"[$|\W](https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*[-a-zA-Z0-9@%_\+~#//=])?)"
  url_regex = "[$|\\W](https?:\\/\\/(www\\.)?[-a-zA-Z0-9@:%._\\+~#=]{1,256}\\.[a-zA-Z0-9()]{1,63}\\b([-a-zA-Z0-9()@:%_\\+.~#?&//=!]*[-a-zA-Z0-9@%_\\+~#//=!])?)"
)

usethis::use_data(regexs, internal = TRUE, overwrite = TRUE)
