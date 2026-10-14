TECTONIC ?= $(CURDIR)/.env/latex/bin/tectonic
LATEXMK ?= latexmk
ENGINE ?= tectonic
export XDG_CACHE_HOME ?= $(CURDIR)/.cache

.PHONY: slides examples all setup clean FORCE
slides: build/slides.pdf
examples: build/starter.pdf build/widescreen.pdf
all: slides examples

# Recheck the output even when the selected engine changes.
build/%.pdf: %.tex reference-theme.sty $(wildcard assets/*) FORCE
	mkdir -p build
ifeq ($(ENGINE),tectonic)
	$(TECTONIC) --keep-logs --outdir build $<
else ifeq ($(ENGINE),latexmk)
	$(LATEXMK) -pdf -interaction=nonstopmode -halt-on-error -outdir=build $<
else
	$(error Unsupported ENGINE '$(ENGINE)'; use tectonic or latexmk)
endif

FORCE:

setup:
	CONDA_PKGS_DIRS="$(CURDIR)/.cache/conda" conda env create --prefix "$(CURDIR)/.env/latex" --file environment.yml

clean:
	rm -rf build
