LATEX = pdflatex -interaction=batchmode
PDF2SVG = pdftocairo -svg

.PHONY: all clean

all: bullshtbody

bullshtbody: bullshtbody.pdf bullshtbody.svg

%.pdf: %.tex
	$(LATEX) $<

%.svg: %.pdf
	$(PDF2SVG) -svg $< $@

clean:
	@find . -name "*.aux" -type f -delete
	@find . -name "*.log" -type f -delete
	@find . -name "*.pdf" -type f -delete
	@echo "Deleted .aux .log .pdf files."
