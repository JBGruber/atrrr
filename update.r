# check without rebuilding vignettes
devtools::check(build_args = c("--no-manual", "--as-cran", "--no-build-vignettes", "--ignore-vignettes"),
                args = c("--no-manual", "--as-cran", "--no-build-vignettes", "--ignore-vignettes"))

# only build when something has changed
pkgdown::build_site()
devtools::build_readme()
devtools::build_vignettes()
