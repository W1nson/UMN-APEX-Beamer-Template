# UMN APEX Beamer template

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

## Build with TeX Live or MiKTeX

If you already have `latexmk` and pdfLaTeX installed, no Conda setup is needed:

```sh
make all ENGINE=latexmk
```

Install Beamer, TikZ/PGF, Latin Modern, and booktabs through your TeX distribution.
Run all commands from the repository root. `make slides` builds the original
4:3 example; `make examples` builds the two additional decks; `make all` builds
all three. These targets also accept `ENGINE=latexmk`. `make clean` removes the
entire generated `build/` directory.

## Included decks

| Source | Purpose | Output |
| --- | --- | --- |
| `slides.tex` | Original 4:3 examples with overlays, equations, and a plot | `build/slides.pdf` |
| `starter.tex` | Minimal 4:3 deck with subtitle and frame numbers | `build/starter.pdf` |
| `widescreen.tex` | 16:9 deck with blocks, a table, and code | `build/widescreen.pdf` |

Copy `starter.tex` to start a presentation. For another root-level file named
`talk.tex`, use `make build/talk.pdf ENGINE=latexmk` (or the default Tectonic engine).

## Change the layout

At the top of your deck, change just this line:

```tex
\widescreenfalse  % Standard 4:3
```

For wide slides, use:

```tex
\widescreentrue   % Widescreen 16:9
```

Recompile the same file. This works locally and on Overleaf; you do not need to
switch example files or edit the theme. The original and starter decks default
to 4:3, and the widescreen example defaults to 16:9.

## Customize

- Edit `slides.tex` for title, author, institution, date, and content.
- Edit `reference-theme.sty` for colors and styling.
- Each `frame` defines a slide; `\pause` adds a reveal page.

Optional theme features are selected when loading the package:

```tex
\usepackage[numbered,nonavigation]{reference-theme}
```

- `numbered`: show current/total frame numbers; overlays keep the same number.
- `nonavigation`: hide the section bar, useful when there are many sections.
- `nologo`: omit both title-page logos, allowing a deck without the assets.

By default, the section bar and logos appear, and frame numbers are hidden.
Navigation icons are hidden. The theme renders `\subtitle{...}` when provided
and styles standard, alert, and example blocks with the maroon/gold palette.
Use `[plain,noframenumbering]` on title frames to hide the header and footer and
exclude the title from the frame count. Code using `verbatim` needs a
`[fragile]` frame; see `widescreen.tex`.

To change the artwork without editing the theme, place this after loading it:

```tex
\renewcommand{\umnwordmark}{assets/my-wordmark.png}
\renewcommand{\umnapexlogo}{assets/my-logo.png}
```

The examples include lists, blocks, an equation, and a two-column figure.
The sample compiles to seven PDF pages, including one reveal.

## Overleaf

Upload `slides.tex`, `reference-theme.sty`, and the `assets/` directory, preserving
the directory structure. Include `starter.tex` or `widescreen.tex` if using those examples. Set the
chosen `.tex` file as the main document, and compile with pdfLaTeX.

Generated PDFs, compiler logs, caches, and local environments are ignored by Git.

## Branding assets

- `assets/apex_icon.jpg`: user-provided UMN APEX logo, unchanged.
- `assets/logoumn.png`: UMN logo from the user-selected [UofMN Beamer template](https://github.com/hamid-m/UofMN-Beamer-Template/blob/master/logoumn.png), unchanged.
- Theme colors: UMN maroon `#7A0019` and UMN gold `#FFCC33`.

See [asset sources](assets/README.md) for provenance. The PNG is used by LaTeX. Adjust the logo sizes in `reference-theme.sty`.

## Troubleshooting

- Missing `.env/latex/bin/tectonic`: run `make setup`, set `TECTONIC` to an
  existing installation, or use `ENGINE=latexmk`.
- Missing image: compile from the repository root and preserve `assets/`,
  or use the `nologo` option.
- Empty outline or incorrect totals after a direct pdfLaTeX invocation: compile
  again. Tectonic and latexmk handle the required passes automatically.
- A long title or subtitle can exceed the title slide: shorten it or reduce the
  title font with `\setbeamerfont{title}{size=\Large}` after loading the theme.
