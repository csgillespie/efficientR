## Efficient R programming by Colin Gillespie and Robin Lovelace

[![Build Status](https://travis-ci.org/csgillespie/efficientR.png?branch=master)](https://travis-ci.org/csgillespie/efficientR) 

![alt text](figures/f0_front_scale.png)

The text and code for the forthcoming O'Reilly book: [Efficient R programming](https://csgillespie.github.io/efficientR/). Pull requests and general comments are welcome.

Get a hard copy from: [Amazon (UK)](https://alexa.design/2pmrqBj), [Amazon (USA)](https://alexa.design/2pmfpf4), [O'Reilly](http://shop.oreilly.com/product/0636920047995.do)

For details on how to build this book, please see the [Appendix](https://csgillespie.github.io/efficientR/building-the-book-from-source.html).

To run the book in a Docker container run the following commands

```bash
# from Docker hub
# docker run -e PASSWORD=pw --rm -p 8786:8787 robinlovelace/efficientR
# local version from inside this repo:
docker build -t efficientr docker/rstudio
docker run -e PASSWORD=pw --rm -p 8786:8787 efficientr
```
