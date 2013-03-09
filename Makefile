TO_CLEAN=aux log blg bbl bib~ tex~ out toc dvi tfm 514pk 600pk
THESIS_SOURCE=text/thesis
THESIS_DEST=text
TEX_ARGS=--shell-escape -interaction batchmode -output-directory ${THESIS_DEST}

.PHONY: thesis
thesis:
	latex ${TEX_ARGS} ${THESIS_SOURCE}; \
	bibtex ${THESIS_SOURCE}; \
	latex ${TEX_ARGS} ${THESIS_SOURCE}; \
	pdflatex ${TEX_ARGS} ${THESIS_SOURCE}; \
	for EXT in $(TO_CLEAN); do \
		echo "Deleting *.$$EXT"; \
		for FILE in *.$$EXT; do \
			rm -f "$$FILE"; \
		done \
	done
	for EXT in $(TO_CLEAN); do \
		echo "Deleting *.$$EXT"; \
		for FILE in ${THESIS_DEST}/*.$$EXT; do \
			rm -f "$$FILE"; \
		done \
	done
