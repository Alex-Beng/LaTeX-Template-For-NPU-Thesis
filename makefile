TEX      = xelatex
BIB      = bibtex
MAIN     = example

target: close clean tex open

tex: $(MAIN).tex
	$(TEX) $(MAIN).tex
	$(BIB) $(MAIN).aux
	$(TEX) $(MAIN).tex
	$(TEX) $(MAIN).tex

open: $(MAIN).pdf
	cmd /c start $(MAIN).pdf

close:
	cmd /c taskkill /im Acrobat.exe /t /f || echo not find

clean:
	del /s /f *.aux *.bbl *.blg *.log *.out *.gz *.toc *.thm *.fdb_latexmk *.fls

wipe:
	del /f $(MAIN).pdf

.PHONY: clean
