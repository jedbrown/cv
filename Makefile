jed.pdf : jed.tex
	@make checkbib
	pdflatex -shell-escape $<
	for file in *.aux; do bibtex `basename $$file .aux`; done
	pdflatex -shell-escape $<
	pdflatex -shell-escape $<

jedbib.bib :
	ln -s ~/jedbib/jedbib.bib
petscapp.bib petsc.bib:
	ln -s ${PETSC_DIR}/src/docs/tex/$@

.PHONY: checkbib clean
checkbib : jedbib.bib petsc.bib petscapp.bib

clean:
	rm -f *.aux *.bbl *.log *.blg *.toc *.nav *.out *.snm *.vrb *~
