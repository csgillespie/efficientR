html:
	Rscript build.R
	cp -fvr css/style.css _book/
	cp -fvr images _book/
	
pdf:
	cp _bookdown.yml _output.yml
	Rscript -e 'bookdown::render_book("index.Rmd", output_format = "bookdown::pdf_book")'

clean:
	Rscript -e "bookdown::clean_book(TRUE)"
	rm -fvr *.log Rplots.pdf _output.yml
