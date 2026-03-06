PACKAGE = sharedline

all: sty doc

sty: $(PACKAGE).sty

doc: $(PACKAGE).pdf

$(PACKAGE).sty: $(PACKAGE).dtx $(PACKAGE).ins
	tex $(PACKAGE).ins

$(PACKAGE).pdf: $(PACKAGE).dtx $(PACKAGE).sty
	pdflatex -interaction=nonstopmode $(PACKAGE).dtx
	makeindex -s gind.ist $(PACKAGE).idx
	makeindex -s gglo.ist -o $(PACKAGE).gls $(PACKAGE).glo
	pdflatex -interaction=nonstopmode $(PACKAGE).dtx

zip: all
	rm -f $(PACKAGE).zip
	zip $(PACKAGE).zip $(PACKAGE).dtx $(PACKAGE).ins $(PACKAGE).pdf README.md LICENSE

clean:
	rm -f $(PACKAGE).{aux,log,out,toc,idx,ind,ilg,glo,gls,hd,synctex.gz}

.PHONY: all sty doc zip clean
