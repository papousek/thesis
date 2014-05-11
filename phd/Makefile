LATEX=pdflatex -interaction batchmode
BIBTEX=bibtex

MISC_TEX=$(shell find misc-text -name '*.tex')
PRESENTATION_TEX=$(shell find presentation -name '*.tex')
PAPER_TEX=$(shell find paper -name '*.tex')



###############################################################################
# Build
###############################################################################

build-all: build-misc build-presentation build-paper

build-misc: $(foreach FILE, $(MISC_TEX), target/misc-text/$(shell basename $(FILE) '.tex').pdf)

build-presentation: $(foreach FILE, $(PRESENTATION_TEX), target/presentation/$(shell basename $(FILE) '.tex').pdf)

build-paper: $(foreach FILE, $(PAPER_TEX), target/paper/$(shell basename $(FILE) '.tex').pdf)


###############################################################################
# General
###############################################################################

target:
	mkdir -p target;

target/bibliography.bib: bibliography/*.bib | target
	bibtool -s bibliography/*.bib > target/bibliography.bib;

target/%/bibliography.bib: target/bibliography.bib | target/$*
	rm -rf target/$*/bibliography.bib; \
	ln -s `pwd`/target/bibliography.bib target/$*/bibliography.bib;

clean:
	rm -rf target;


###############################################################################
# Misc. text
###############################################################################

target/misc-text: misc-text/* | target
	cp -r misc-text target; \
	cd target/misc-text; \
	for FILE in `ls ../../templates/`; do \
		rm -rf $$FILE; \
		ln -s ../../templates/$$FILE $$FILE; \
	done;

target/misc-text/%.pdf: misc-text/$** target/misc-text/bibliography.bib | target/misc-text
	cd target/misc-text; \
	${LATEX} $*; \
	${BIBTEX} $*; \
	${LATEX} $*; \
	${LATEX} $*; \
	for FILE in `ls --ignore=*.pdf | grep $*`; do \
		echo $$FILE; \
		rm -rf "$$FILE"; \
	done;


###############################################################################
# Papers
###############################################################################

target/paper: paper/* | target
	cp -r paper target; \
	cd target/paper; \
	for FILE in `ls ../../templates/`; do \
		rm -rf $$FILE; \
		ln -s ../../templates/$$FILE $$FILE; \
	done;

target/paper/%.pdf: paper/$** target/paper/bibliography.bib | target/paper
	cd target/paper; \
	${LATEX} $*; \
	${BIBTEX} $*; \
	${LATEX} $*; \
	${LATEX} $*; \
	for FILE in `ls --ignore=*.pdf | grep $*`; do \
		echo $$FILE; \
		rm -rf "$$FILE"; \
	done;


###############################################################################
# Presentation
###############################################################################

target/beamer-theme:
	cd target; \
	git clone git@github.com:proso/beamer-theme.git;

target/presentation: | target/beamer-theme
	set -x; \
	cp -r presentation target; \
	cd target/presentation; \
	for FILE in `ls ../beamer-theme/theme/`; do \
		ln -s ../beamer-theme/theme/$$FILE $$FILE; \
	done;

target/presentation/%.pdf: presentation/$** target/presentation/bibliography.bib | target/presentation
	cd target/presentation; \
	${LATEX} $*; \
	${BIBTEX} $*; \
	${LATEX} $*; \
	${LATEX} $*; \
	for FILE in `ls --ignore=*.pdf | grep $*`; do \
		echo $$FILE; \
		rm -rf "$$FILE"; \
	done;
