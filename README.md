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

# Notebooks

To render the notebooks, use the `qmd_render.sh` script; it requires Docker.
The rendered HTML files will be in the `notebook` folder.

```console
./script/qmd_render.sh notebook/computations.qmd
```
```
[ 2023/08/14 13:32:49 ] Start job

[31m

processing file: computations.qmd
[39m1/11                  
2/11 [load-packages]  
3/11                  
4/11 [fig-scatterplot]
5/11                  
6/11 [fig-mpg]        
7/11                  
8/11 [tab-mpg]        
9/11                  
10/11 [session_info]   
11/11                  
[31moutput file: computations.knit.md

[39m[1mpandoc [22m
  to: html
  output-file: computations.html
  standalone: true
  section-divs: true
  html-math-method: mathjax
  wrap: none
  default-image-extension: png
  
[1mmetadata[22m
  document-css: false
  link-citations: true
  lang: en
  title: Quarto Computations
  date: '`r format(Sys.Date(), "%Y-%m-%d")`'
  date-format: YYYY-MM-DD
  
[31mWarning message:
In postprocess(params$input, params$format, params$output, params$preserve) :
  The downlit and xml2 packages are required for code linking
[39mOutput created: computations.html

[ 2023/08/14 13:32:56 ] Work complete
0 minutes and 7 seconds elapsed.
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
