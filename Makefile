PDFLATEX = pdflatex -shell-escape

jed.pdf : jed.tex
	@make checkbib
	$(PDFLATEX) $<
	for file in *jed.aux; do bibtex `basename $$file .aux`; done
	$(PDFLATEX) $<
	$(PDFLATEX) $<

jedshort.pdf : jedshort.tex
	@make checkbib
	$(PDFLATEX) $<
	for file in *jedshort.aux; do bibtex `basename $$file .aux`; done
	$(PDFLATEX) $<
	$(PDFLATEX) $<

jedbib.bib :
	ln -s ~/jedbib/jedbib.bib
petscapp.bib petsc.bib:
	ln -s ${PETSC_DIR}/src/docs/tex/$@

.PHONY: checkbib clean
checkbib : jedbib.bib petsc.bib petscapp.bib

clean:
	rm -f *.aux *.bbl *.log *.blg *.toc *.nav *.out *.snm *.vrb *~
