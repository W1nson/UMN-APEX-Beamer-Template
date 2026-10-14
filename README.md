# Beamer template

A reusable 4:3 LaTeX Beamer template with a maroon section navigation bar,
rounded maroon title box with gold text, gold frame headings, and shaded blocks.
The title page includes the UMN wordmark banner and UMN APEX logo.
The style is inspired by the [University of Minnesota sample presentation](https://users.stat.umn.edu/~rend0020/Teaching/STAT8801-2009Spring/resources/mystuff/mystuff.pdf).

## Setup and build

Install Conda and Make, then run:

```sh
make setup
make slides
```

The PDF is written to `build/slides.pdf`. Tectonic performs the required
LaTeX passes automatically. The first build needs internet access to fetch
its TeX bundle; later builds reuse cached resources.

To use an existing Tectonic installation:

```sh
make slides TECTONIC=/absolute/path/to/tectonic
```

`environment.yml` pins Tectonic 0.17.0. For the exact Linux x86_64 environment:

```sh
conda create --prefix .env/latex --file latex-linux-64.lock.txt
make slides
```

## Customize

- Edit `slides.tex` for title, author, institution, date, and content.
- Edit `reference-theme.sty` for colors and styling.
- Change `aspectratio=43` to `aspectratio=169` for widescreen.
- Each `frame` defines a slide; `\pause` adds a reveal page.

The examples include lists, blocks, an equation, and a two-column figure.
The sample compiles to seven PDF pages, including one reveal.

## Overleaf

Upload `slides.tex`, `reference-theme.sty`, and the `assets/` directory, preserving
the directory structure. Set `slides.tex` as the main
document, and compile with pdfLaTeX.

Generated PDFs, compiler logs, caches, and local environments are ignored by Git.

## Branding assets

- `assets/apex_icon.jpg`: user-provided UMN APEX logo, unchanged.
- `assets/logoumn.png`: UMN logo from the user-selected [UofMN Beamer template](https://github.com/hamid-m/UofMN-Beamer-Template/blob/master/logoumn.png), unchanged.
- Theme colors: UMN maroon `#7A0019` and UMN gold `#FFCC33`.

See [asset sources](assets/README.md) for provenance. The PNG is used by LaTeX. Adjust the logo sizes in `reference-theme.sty`.
