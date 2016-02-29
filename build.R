
l = list("download"="pdf", 
  "edit"=list("link"="https://github.com/csgillespie/efficientR/edit/master/%s",
              "text"="Edit")); 
bookdown::render_book("index.Rmd", 
                      output_format = bookdown::gitbook(config=l))


