target:
	mkdir -p target;

target/bibliography.bib: target
	bibtool -s bibliography/*.bib > target/bibliography.bib;

target/build:
	mkdir -p target/build; \
	cp -r misc-text target/build; \

target/clone: target
	LOCAL_REPO=`pwd`/..; \
	cd target; \
	git clone "$$LOCAL_REPO" clone;

target/misc-text: target/build target/bibliography.bib
	ln -s ../../bibliography.bib target/build/misc-text/bibliography.bib; \
	cd target/build/misc-text; \
	for FILE in *.tex; do \
		BASEFILE=`basename $$FILE .tex`; \
		echo "processing $$BASEFILE"; \
		pdflatex "$$BASEFILE"; \
		bibtex "$$BASEFILE"; \
		pdflatex "$$BASEFILE"; \
		pdflatex "$$BASEFILE"; \
	done; \
	cd ../../; \
	mkdir misc-text; \
	cp build/misc-text/*.pdf misc-text;

clean:
	rm -rf target;

publish: target/clone
	cd target/clone/phd; \
	make clean; \
	make target/misc-text; \
	TIMESTAMP=`date +%Y-%m-%d_%H-%M`; \
	ssh xpapous1@anna.fi.muni.cz -t "rm -rf public_html/thesis-phd; mkdir -p public_html/thesis-phd; rm -rf public_html/theis-phd-$$TIMESTAMP; mkdir -p public_html/thesis-phd-$$TIMESTAMP"; \
	scp -r target/misc-text xpapous1@anna.fi.muni.cz:public_html/thesis-phd; \
	ssh xpapous1@anna.fi.muni.cz -t "cp -r public_html/thesis-phd/* public_html/thesis-phd-$$TIMESTAMP";
