# Take high quality screenshots of skeets

Take high quality screenshots of skeets

## Usage

``` r
skeet_shot(x, file = NULL, delay = 1, ...)
```

## Arguments

- x:

  a vector of URLs or URIs.

- file:

  output file name. Defaults to the skeet id.

- delay:

  time to wait for content to load. Can make sense to increase if not
  everything is loaded in the screentshot yet.

- ...:

  passed on to
  [webshot](https://rstudio.github.io/webshot2/reference/webshot.html).

## Value

path to file

## Examples

``` r
if (FALSE) { # \dontrun{
df <- atrrr::search_post("rstats")
skeet_shot(df$uri[1:2])
} # }
```
