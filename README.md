## Table of Contents

- [Quarto](#quarto)
- [Quarto CLI](#quarto-cli)
- [Notebooks](#notebooks)
- [Quarto Projects](#quarto-projects)
- [Tips](#tips)
- [Useful links](#useful-links)

# Quarto

Quarto is an open-source scientific and technical publishing system that
supports multiple computing languages built on Pandoc. It is a platform for
[literate programming](https://en.wikipedia.org/wiki/Literate_programming) and
is the next-generation version of R Markdown from Posit.

[Yihui](https://yihui.org/en/vitae/), the author of knitr, bookdown, and other
popular R packages, wrote in a blog post on 2022/04/29 that [R Markdown is not
going away](https://yihui.org/en/2022/04/quarto-r-markdown/). The next natural
question, as a R Markdown user, is whether you should switch. If R Markdown is
sufficient for what you do, then (like with many choices) it's not necessary to
switch. From the blog post:

> The main technical difference between Quarto and R Markdown is that Quarto
  makes heavy use of Pandoc’s Lua filters. One example is the implementation of
  figure cross-references. I have to admit that I never liked my own
  implementation in bookdown, which was hackish. That’s why I have never ported
  this important and useful feature back into rmarkdown. Using Lua filters to
  process the Markdown document is more robust, and can make one feature
  available in multiple output formats.
>
> Quarto is an attempt to generalize the R Markdown ecosystem, so that all
  useful features for authoring and publishing technical content can be made
  available to a larger world outside R. Quarto’s heavy investment in Pandoc
  Lua filters means that it is not tied to a specific backend that generates
  the .md (Markdown) output file. In case a new tool (oh God, no thanks) like
  knitr and jupyter is invented, Quarto can integrate with it, too.

# Quarto CLI

Quarto is a Command Line Interface (CLI) tool, although there is a `quarto` R
package that provides an R interface to some operations from the CLI. I have a
`Dockerfile` that builds an image with the CLI tool; the image is called
`davetang/quarto:4.3.1` and I have versioned it with the corresponding R
version. The image is 3.72GB and its size could be decreased by excluding some
tools and libraries.

```console
docker run --rm davetang/quarto:4.3.1 check

[✓] Checking versions of quarto binary dependencies...
      Pandoc version 3.1.1: OK
      Dart Sass version 1.55.0: OK
[✓] Checking versions of quarto dependencies......OK
[✓] Checking Quarto installation......OK
      Version: 1.3.450
      Path: /opt/quarto/bin

[✓] Checking basic markdown render....OK

[✓] Checking Python 3 installation....OK
      Version: 3.10.12
      Path: /usr/bin/python3
      Jupyter: 5.3.1
      Kernels: python3

[✓] Checking Jupyter engine render....OK

[✓] Checking R installation...........OK
      Version: 4.3.1
      Path: /usr/local/lib/R
      LibPaths:
        - /usr/local/lib/R/site-library
        - /usr/local/lib/R/library
      knitr: 1.43
      rmarkdown: 2.22

[✓] Checking Knitr engine render......OK
```

# Notebooks

To render the notebooks, use either the `qmd_render.sh` or `quarto.sh` script;
they both require Docker. The former script uses the R `quarto` package and the
latter script uses the Quarto CLI tool. The rendered HTML files will be in the
`notebook` folder.

Using the R `quarto` package.

```console
./script/qmd_render.sh notebook/computations.qmd
```
```
[ 2023/08/15 09:25:34 ] Start job



processing file: hello.qmd
1/5
2/5 [load-packages]
3/5
4/5 [plot-penguins]
5/5
output file: hello.knit.md

pandoc
  to: html
  output-file: hello.html
  standalone: true
  section-divs: true
  html-math-method: mathjax
  wrap: none
  default-image-extension: png

metadata
  document-css: false
  link-citations: true
  lang: en
  title: 'Hello, Quarto'
  date: '`r format(Sys.Date(), "%Y-%m-%d")`'
  date-format: YYYY-MM-DD
  editor: visual

Output created: hello.html


[ 2023/08/15 09:25:40 ] Work complete
0 minutes and 6 seconds elapsed.
```

Using the Quarto CLI tool.

```console
./script/quarto.sh notebook/hello.qmd
```
```
[ 2023/08/15 09:26:00 ] Start job



processing file: hello.qmd
1/5
2/5 [load-packages]
3/5
4/5 [plot-penguins]
5/5
output file: hello.knit.md

pandoc
  to: html
  output-file: hello.html
  standalone: true
  section-divs: true
  html-math-method: mathjax
  wrap: none
  default-image-extension: png

metadata
  document-css: false
  link-citations: true
  lang: en
  title: 'Hello, Quarto'
  date: '`r format(Sys.Date(), "%Y-%m-%d")`'
  date-format: YYYY-MM-DD
  editor: visual

Output created: hello.html


[ 2023/08/15 09:26:06 ] Work complete
0 minutes and 6 seconds elapsed.
```

# Quarto Projects

A Quarto Project is a directory that contains a `_quarto.yml` configuration file, which coordinates how multiple `.qmd` files are rendered together into a cohesive output (e.g. a website, book, or blog). Projects enable shared metadata, navigation, and site-wide options across all documents.

## Initialise a project

Use `quarto create project` to scaffold a new project interactively, or pass the type and directory name directly:

```console
# create a website project in the current directory
quarto create project website .

# other project types: book, blog, manuscript, default
quarto create project book mybook
```

This generates a `_quarto.yml` file and starter `.qmd` files appropriate for the chosen project type.

## Render a project

Run `quarto render` from the project root to render all documents defined in `_quarto.yml`. Output is written to the `_site/` directory by default for website projects.

```console
# Render every document in the project
quarto render

# Render a single file within the project
quarto render index.qmd

# Render to a specific format
quarto render --to pdf
```

## R and R packages

Quarto uses whichever `R` binary is first on `PATH` - there is no project-level R version pinning out of the box. You can verify which R it will use with:

```console
quarto check
```
```
Quarto 1.8.26
[snipped]
      Version: 4.5.2
      Path: /usr/lib/R
      LibPaths:
        - /home/dtang/R/x86_64-pc-linux-gnu-library/4.5
        - /usr/local/lib/R/site-library
        - /usr/lib/R/site-library
        - /usr/lib/R/library
      knitr: 1.50
      rmarkdown: 2.30
[snipped]
```

R packages are loaded from the library paths that R itself reports (`R -e ".libPaths()"`), which typically means the user library (`~/R/<platform>/<version>/`) and the system library. There is no project-local package isolation by default, so every project on a machine shares the same global package installation.

To get reproducible, project-local package libraries, add [renv](https://rstudio.github.io/renv/) to the project:

```r
# Run once inside the project to initialise a private library
renv::init()
```

Quarto detects an active `renv` environment automatically (via the project's `.Rprofile`) and installs or restores packages into the project-local `renv/library/` instead of the global library. Commit `renv.lock`, `.Rprofile`, and `renv/activate.R` to version control so collaborators and CI runners can reproduce the exact same package versions with `renv::restore()`.

## Preview a project locally

`quarto preview` starts a local development server and live-reloads the browser whenever a source file changes — useful while authoring.

```console
quarto preview
```

## Publish to GitHub Pages

Quarto has built-in support for publishing to GitHub Pages via the `quarto publish` command. On first run it will ask for confirmation and create or update the `gh-pages` branch; subsequent runs are non-interactive.

```console
# Publish (or re-publish) to GitHub Pages
quarto publish gh-pages
```

Quarto renders the project, copies the output to the `gh-pages` branch, and pushes it to the remote. Make sure GitHub Pages is configured to serve from the `gh-pages` branch in the repository settings (**Settings -> Pages -> Branch -> gh-pages / root**).

For CI/CD pipelines (e.g. GitHub Actions), freeze computed outputs first so the workflow does not need to re-execute code:

```console
# Freeze all outputs before committing (run locally)
quarto render --freeze

# Then in CI, publish without re-executing notebooks
quarto publish gh-pages --no-render
```

# Tips

[Automatically](https://github.com/quarto-dev/quarto-cli/issues/4530) fit title text using `.r-fit-text`. For example:

```
---
format: revealjs
---

## [This is a veeeeeeeeeeeeeeeeerrrrryyyy loooooooooooooooooooooooooooonnnnngggggg title]{.r-fit-text}

- Hi
```

Using [dynamic variables](https://quarto.org/docs/authoring/variables.html) within a document. For example, specify the following in the YAML header:

```
version: 1.2
```

and use `{{< var version >}}` to reference it within the document.

Use [template partials](https://quarto.org/docs/journals/templates.html#including-partials) to customise your output.

# Useful links

* [Automating Quarto reports with parameters](https://posit.co/blog/parameterized-quarto/)
* [Extensions for Quarto](https://github.com/quarto-ext#extensions-for-quarto)
* [FAQ for R Markdown Users](https://quarto.org/docs/faq/rmarkdown.html)
* [awesome-quarto](https://github.com/mcanouil/awesome-quarto)
    * [Tutorial: Hello,
    Quarto](https://quarto.org/docs/get-started/hello/rstudio.htmlhttps://quarto.org/docs/get-started/hello/rstudio.html).
    * [From R Markdown to
    Quarto](https://rstudio-conf-2022.github.io/rmd-to-quarto/)
    * [I'm an R user: Quarto or R
    Markdown](https://www.jumpingrivers.com/blog/quarto-rmarkdown-comparison/)
* [Quarto tricks](https://github.com/holtzy/quarto-tricks)
