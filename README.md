## Efficient R programming by Colin Gillespie and Robin Lovelace
[![Build Status](https://travis-ci.org/csgillespie/efficientR.png?branch=master)](https://travis-ci.org/csgillespie/efficientR) 


This book has been written in **Markdown** and was built with the bookdown package. It will 
eventually be published by O'Reilly.
The html version is also [available](https://csgillespie.github.io/efficientR/). 
Pull requests are welcome.

To build this book on your own system, you will need to install the following packages.

```
pkgs = c(
  "numbers", "dplyr", "readxl",
  "readr", "grid", "png",
  "rbenchmark", "microbenchmark",
  "fortunes", "pryr", "ggplot2")

to_install = pkgs[!pkgs %in% installed.packages()]
if(length(to_install))
  install.packages(to_install)
```

GitHub packages to install.

```
gh_pkgs = c("csgillespie/efficient_pkg", "rstudio/bookdown")
devtools::install_github(gh_pkgs)
```




