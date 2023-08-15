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

# Useful links

* [FAQ for R Markdown Users](https://quarto.org/docs/faq/rmarkdown.html)
* [awesome-quarto](https://github.com/mcanouil/awesome-quarto)
    * [Tutorial: Hello,
    Quarto](https://quarto.org/docs/get-started/hello/rstudio.htmlhttps://quarto.org/docs/get-started/hello/rstudio.html).
    * [From R Markdown to
    Quarto](https://rstudio-conf-2022.github.io/rmd-to-quarto/)
    * [I'm an R user: Quarto or R
    Markdown](https://www.jumpingrivers.com/blog/quarto-rmarkdown-comparison/)
