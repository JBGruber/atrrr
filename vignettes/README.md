Build the vignettes with:

```
setwd("vignettes")
knitr::knit("vignettes/Basic_Usage.Rmd.orig", output = "vignettes/Basic_Usage.Rmd")
knitr::knit("vignettes/Feed_Analysis.Rmd.orig", output = "vignettes/Feed_Analysis.Rmd")
knitr::knit("vignettes/Interactions.Rmd.orig", output = "vignettes/Interactions.Rmd")
knitr::knit("vignettes/Networks.Rmd.orig", output = "vignettes/Networks.Rmd")
```

This will use your `atrrr` token to run the commands.
The RMDs then only contain the results.
