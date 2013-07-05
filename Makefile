BOOKNAME = main
COLORPLATES = main-color

all:	$(BOOKNAME).pdf

$(BOOKNAME).pdf:  $(BOOKNAME).tex \
                  Chapters/part3-ch5-adios/part3-ch5-adios.tex \
                  Chapters/part3-ch5-adios/part3-ch5-adios.bib \
                  Chapters/part3-ch5-adios/analysis-climate.tex \
                  Chapters/part3-ch5-adios/analysis.tex \
                  Chapters/part3-ch5-adios/ckp.tex \
                  Chapters/part3-ch5-adios/coupling.tex \
                  Chapters/part3-ch5-adios/design.tex \
                  Chapters/part3-ch5-adios/intro.tex \
                  Chapters/part3-ch5-adios/reduction.tex \
                  Chapters/part3-ch5-adios/visualization.tex
	touch $(BOOKNAME).ind
	pdflatex $(BOOKNAME)
	./bibUnitWeaver.sh
	makeindex $(BOOKNAME).idx
	pdflatex $(BOOKNAME)
	pdflatex $(BOOKNAME)


clean:
	if (rm $(COLORPLATES).pdf $(BOOKNAME).pdf $(BOOKNAME).ind *.ilg x.tex *.bbl *.blg *.aux *.idx *.log *.toc *~ *.lof *.lot *.dx *.ind Chapters/*/*~ Chapters/*/*.aux frontmatter/*~ frontmatter/*.aux) then :; fi
