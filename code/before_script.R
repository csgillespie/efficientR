## Needed for Rscript
library("methods")
library("microbenchmark")
## Needed because CSG doesn't load datasets
data("USArrests", package="datasets")


knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  cache = TRUE, 
  fig.align="center",
  fig.pos="t"
)
set.seed(2016)
options(digits = 3)
options(dplyr.print_min = 4, dplyr.print_max = 4)