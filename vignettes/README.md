Build the vignettes with:

```
setwd("vignettes")
knitr::knit("Basic_Usage.Rmd.orig", output = "Basic_Usage.Rmd")
knitr::knit("Feed_Analysis.Rmd.orig", output = "Feed_Analysis.Rmd")
knitr::knit("Interactions.Rmd.orig", output = "Interactions.Rmd")
knitr::knit("Networks.Rmd.orig", output = "Networks.Rmd")
```

This will use your `atrrr` token to run the commands.
The RMDs then only contain the results.
