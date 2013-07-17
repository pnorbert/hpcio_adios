BOOKNAME = main
COLORPLATES = main-color

all:	$(BOOKNAME).pdf

$(BOOKNAME).pdf:  $(BOOKNAME).tex \
                  Chapters/part3-ch6-adios/part3-ch6-adios.tex \
                  Chapters/part3-ch6-adios/part3-ch6-adios.bib \
                  Chapters/part3-ch6-adios/intro.tex  \
                  Chapters/part4-ch5-s3d/part4-ch5-s3d.tex \
                  Chapters/part4-ch5-s3d/part4-ch5-s3d.bib
	touch $(BOOKNAME).ind
	pdflatex $(BOOKNAME)
	./bibUnitWeaver.sh
	makeindex $(BOOKNAME).idx
	pdflatex $(BOOKNAME)
	pdflatex $(BOOKNAME)


clean:
	if (rm $(COLORPLATES).pdf $(BOOKNAME).pdf $(BOOKNAME).ind *.ilg x.tex *.bbl *.blg *.aux *.idx *.log *.toc *~ *.lof *.lot *.dx *.ind Chapters/*/*~ Chapters/*/*.aux frontmatter/*~ frontmatter/*.aux) then :; fi
