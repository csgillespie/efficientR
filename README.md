## Efficient R programming by Colin Gillespie and Robin Lovelace
[![Build Status](https://travis-ci.org/csgillespie/efficientR.png?branch=master)](https://travis-ci.org/csgillespie/efficientR) 

![alt text](figures/front_scale.png)

The text and code for the forthcoming O'Reilly book: [Efficient R programming](https://csgillespie.github.io/efficientR/). Pull requests and general comments are welcome.


### Building this book

To build this book on your own system, you will need to install the following packages.

```
pkgs = c("dplyr", "readxl",
  "readr", "grid", "png",
  "rbenchmark", "microbenchmark",
  "fortunes", "pryr", "ggplot2")

to_install = pkgs[!pkgs %in% installed.packages()]
if(length(to_install))
  install.packages(to_install)
```

GitHub packages to install:

```
gh_pkgs = c("csgillespie/efficient_pkg", "rstudio/bookdown", "csgillespie/benchmarkme")
devtools::install_github(gh_pkgs)
```

To build the book, run

```
bookdown::render_book("index.Rmd",  bookdown::html_chapters())
```






 



