## Needed for Rscript
library("methods")
library("microbenchmark")
## Needed because CSG doesn't load datasets
data("USArrests", package="datasets")


knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  cache = TRUE
)
set.seed(2016)
options(digits = 3)
options(dplyr.print_min = 5, dplyr.print_max = 5)