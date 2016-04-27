alpha=255
colours = c(rgb(200,79,178, alpha=alpha,maxColorValue=255), 
            rgb(105,147,45, alpha=alpha, maxColorValue=255),
            rgb(85,130,169, alpha=alpha, maxColorValue=255),
            rgb(204,74,83, alpha=alpha, maxColorValue=255),
            rgb(183,110,39, alpha=alpha, maxColorValue=255),
            rgb(131,108,192, alpha=alpha, maxColorValue=255),
            rgb(63,142,96, alpha=alpha, maxColorValue=255))
palette(colours)

get_col = function(i, alpha=255) {
  c(rgb(200,79,178, alpha=alpha,maxColorValue=255), 
    rgb(105,147,45, alpha=alpha, maxColorValue=255),
    rgb(85,130,169, alpha=alpha, maxColorValue=255),
    rgb(204,74,83, alpha=alpha, maxColorValue=255),
    rgb(183,110,39, alpha=alpha, maxColorValue=255),
    rgb(131,108,192, alpha=alpha, maxColorValue=255),
    rgb(63,142,96, alpha=alpha, maxColorValue=255))[i]
}