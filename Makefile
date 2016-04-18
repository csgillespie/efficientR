html:
	Rscript build.R
	cp style.css _book

pdf:
	Rscript -e 'bookdown::render_book("index.Rmd", output_format = "bookdown::pdf_book")'

clean:
	rm -fvr *.html *.php
	rm -fvr _main_files _main_cache

cleaner:
	make clean
	rm -fvr _book/
