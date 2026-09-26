# learnings — build and release
#
# make          — compile all TeX sources in tex/ into pdf/
# make release  — compile, then copy the PDFs into $(RELEASE_DIR) (~/docs for now)
# make clean    — remove TeX build artifacts from pdf/

TEX_DIR     := tex
PDF_DIR     := pdf
RELEASE_DIR := $(HOME)/docs

TEX_FILES := $(wildcard $(TEX_DIR)/*.tex)
PDF_FILES := $(patsubst $(TEX_DIR)/%.tex,$(PDF_DIR)/%.pdf,$(TEX_FILES))

.PHONY: all release clean

all: $(PDF_FILES)

$(PDF_DIR)/%.pdf: $(TEX_DIR)/%.tex | $(PDF_DIR)
	pdflatex -interaction=nonstopmode -halt-on-error -output-directory $(PDF_DIR) $<
	pdflatex -interaction=nonstopmode -halt-on-error -output-directory $(PDF_DIR) $<

$(PDF_DIR):
	mkdir -p $(PDF_DIR)

release: all
	install -d $(RELEASE_DIR)
	install -m 644 $(PDF_FILES) $(RELEASE_DIR)/
	@echo "Released: $(PDF_FILES) -> $(RELEASE_DIR)"

clean:
	rm -f $(PDF_DIR)/*.aux $(PDF_DIR)/*.log $(PDF_DIR)/*.out $(PDF_DIR)/*.toc