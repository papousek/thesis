TO_CLEAN=aux log blg bbl bib~ tex~ out toc dvi tfm 514pk 600pk aux
THESIS_SOURCE=thesis
TEX_ARGS=--shell-escape -interaction batchmode

.PHONY: thesis

thesis: images/generated
	cd text; pdflatex ${TEX_ARGS} ${THESIS_SOURCE}; bibtex ${THESIS_SOURCE}; pdflatex ${TEX_ARGS} ${THESIS_SOURCE}; pdflatex ${TEX_ARGS} ${THESIS_SOURCE};
	cd text; for EXT in $(TO_CLEAN); do \
		echo "Deleting *.$$EXT"; \
		for FILE in *.$$EXT; do \
			rm -f "$$FILE"; \
		done \
	done

images/generated:
	rm -rf images/generated;
	mkdir images/generated;
	cd scripts; for FILE in image-*.r; do \
		echo "Executing $$FILE"; \
		R --vanilla < "$$FILE"; \
	done

