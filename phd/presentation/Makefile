build.%:
	cd ..; make target/bibliography.bib; cd -; \
	cd $*; \
	ln -s ../../target/bibliography.bib bibliography.bib; \
	TEXFILE=`ls *.tex | grep tex | awk -F " " '{print $9}'`; \
	BASEFILE=`basename $$TEXFILE .tex`; \
	pdflatex $$BASEFILE; \
	bibtex $$BASEFILE; \
	pdflatex $$BASEFILE; \
	pdflatex $$BASEFILE;


clean.%:
	cd $*; \
	rm -rf *.aux *.log *.nav *.out *.snm *.toc *.bbl *.blg *.bib;

prepare.style:
	rm -rf /tmp/beamer-theme; \
	cd /tmp; \
	git clone git@github.com:proso/beamer-theme.git; \
	cd beamer-theme; \
	make install.ubuntu;

