all: paper.pdf

PDFLATEX=pdflatex

figures:
	touch $@

%.aux: %.tex refs.bib 
	$(PDFLATEX) ${basename $<}

%.bbl: %.aux
	bibtex ${basename $<}

%.pdf: %.bbl
	$(PDFLATEX) ${basename $<}
	$(PDFLATEX) ${basename $<}

clean:
	rm -f *.aux *.log *.bbl *.blg *.out
