TECTONIC ?= $(CURDIR)/.env/latex/bin/tectonic
export XDG_CACHE_HOME ?= $(CURDIR)/.cache

.PHONY: slides setup clean
slides: build/slides.pdf

build/slides.pdf: slides.tex reference-theme.sty $(wildcard assets/*)
	mkdir -p build
	$(TECTONIC) --keep-logs --outdir build slides.tex

setup:
	CONDA_PKGS_DIRS="$(CURDIR)/.cache/conda" conda env create --prefix "$(CURDIR)/.env/latex" --file environment.yml

clean:
	rm -f build/slides.pdf build/slides.log
