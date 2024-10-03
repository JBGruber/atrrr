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
usethis::use_github_release()
