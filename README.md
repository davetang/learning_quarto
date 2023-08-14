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

# Useful links

* [FAQ for R Markdown Users](https://quarto.org/docs/faq/rmarkdown.html)
* [awesome-quarto](https://github.com/mcanouil/awesome-quarto)
    * [Tutorial: Hello,
    Quarto](https://quarto.org/docs/get-started/hello/rstudio.htmlhttps://quarto.org/docs/get-started/hello/rstudio.html).
    * [From R Markdown to
    Quarto](https://rstudio-conf-2022.github.io/rmd-to-quarto/)
    * [I'm an R user: Quarto or R
    Markdown](https://www.jumpingrivers.com/blog/quarto-rmarkdown-comparison/)
