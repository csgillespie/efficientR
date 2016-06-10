html:
	Rscript -e 'bookdown::render_book("index.Rmd", output_format = "bookdown::gitbook")'
	cp -fvr css/style.css _book/
	cp -fvr images _book/

pdf:
	Rscript -e 'bookdown::render_book("index.Rmd", output_format = "bookdown::pdf_book")'

md:
	Rscript -e 'bookdown::render_book("index.Rmd", output_format = "bookdown::pdf_book",clean=FALSE)'

## For Colin, who keeps forgetting how to deploy.
deploy:
	Rscript -e 'bookdown::publish_book(render="local", account="csgillespie")'

clean:
	Rscript -e "bookdown::clean_book(TRUE)"
	rm -fvr *.log Rplots.pdf _bookdown_files

cleaner:
	make clean && rm -fvr rsconnect
