# check without rebuilding vignettes
devtools::check(build_args = c("--no-manual", "--as-cran", "--no-build-vignettes", "--ignore-vignettes"),
                args = c("--no-manual", "--as-cran", "--no-build-vignettes", "--ignore-vignettes"))

# re-compute vignettes
setwd(here::here("vignettes"))
knitr::knit("Basic_Usage.Rmd.orig", output = "Basic_Usage.Rmd")
knitr::knit("Feed_Analysis.Rmd.orig", output = "Feed_Analysis.Rmd")
knitr::knit("Interactions.Rmd.orig", output = "Interactions.Rmd")
knitr::knit("Networks.Rmd.orig", output = "Networks.Rmd")

# render site to have a look
setwd(here::here())
pkgdown::build_site()

# submit to CRAN
usethis::use_version("minor")
rhub::rhub_check(platforms = c("linux", "windows", "macos-arm64", "macos"))
devtools::submit_cran()
# once accepted by cran
#usethis::use_github_release()

use_github_release2 <- function (publish = TRUE) {
  usethis:::check_is_package("use_github_release()")
  tr <- usethis:::target_repo(github_get = TRUE, ok_configs = c("ours",
                                                                "fork"))
  usethis:::check_can_push(tr = tr, "to create a release")
  dat <- usethis:::get_release_data(tr)
  release_name <- glue::glue("{dat$Package} {dat$Version}")
  tag_name <- glue::glue("v{dat$Version}")
  usethis:::kv_line("Release name", release_name)
  usethis:::kv_line("Tag name", tag_name)
  usethis:::kv_line("SHA", dat$SHA)
  # if (git_can_push()) {
  #   git_push()
  # }
  usethis:::check_github_has_SHA(SHA = dat$SHA, tr = tr)
  on_cran <- !is.null(usethis:::cran_version())
  news <- usethis:::get_release_news(SHA = dat$SHA, tr = tr, on_cran = on_cran)
  gh <- usethis:::gh_tr(tr)
  usethis:::ui_bullets("Publishing {tag_name} release to GitHub")
  release <- gh("POST /repos/{owner}/{repo}/releases", name = release_name,
                tag_name = tag_name, target_commitish = dat$SHA, body = news,
                draft = !publish)
  usethis:::ui_bullets("Release at {.url {release$html_url}}")
  if (!is.null(dat$file)) {
    usethis:::ui_bullets("Deleting {.path {dat$file}}")
    fs::file_delete(dat$file)
  }
  invisible()
}
use_github_release2()

