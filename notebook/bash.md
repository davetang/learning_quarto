# Bash commands in Quarto
2023-08-25

- [Output format](#output-format)
- [Hello, World](#hello-world)
- [Loops](#loops)
- [Version](#version)

The [principal languages supported by
Quarto](https://quarto.org/docs/faq/#what-programming-languages-are-supported-in-quarto)
are Python, R, Julia, and Observable JavaScript. Each Quarto document
can be optionally processed by a computational engine; the engine can be
manually specified or automatically detected based on the code chunks in
the document. For a `.qmd` document, the Knitr engine will be used if
the is an `{r}` block; the Jupyter engine will be used if there are any
other executable code block, such as `{python}`, `{julia}`, and
`{bash}`, etc. However, we can override this by explicitly [stating the
engine](https://quarto.org/docs/computations/execution-options.html#engine-binding).

Knitr supports the following languages.

``` r
names(knitr::knit_engines$get())
```

     [1] "awk"       "bash"      "coffee"    "gawk"      "groovy"    "haskell"  
     [7] "lein"      "mysql"     "node"      "octave"    "perl"      "php"      
    [13] "psql"      "Rscript"   "ruby"      "sas"       "scala"     "sed"      
    [19] "sh"        "stata"     "zsh"       "asis"      "asy"       "block"    
    [25] "block2"    "bslib"     "c"         "cat"       "cc"        "comment"  
    [31] "css"       "ditaa"     "dot"       "embed"     "eviews"    "exec"     
    [37] "fortran"   "fortran95" "go"        "highlight" "js"        "julia"    
    [43] "python"    "R"         "Rcpp"      "sass"      "scss"      "sql"      
    [49] "stan"      "targets"   "tikz"      "verbatim"  "ojs"       "mermaid"  

## Output format

For displaying the output on GitHub, we can use [GitHub Flavoured
Markdown](https://quarto.org/docs/output-formats/gfm.html) (GFM) by
specifying `gfm` as our format in the YAML. See [GFM
Options](https://quarto.org/docs/reference/formats/markdown/gfm.html)
for a list of GFM output options.

## Hello, World

``` bash
echo Hello, World
```

    Hello, World

## Loops

``` bash
for i in {0..9}; do
   echo ${i}
done
```

    0
    1
    2
    3
    4
    5
    6
    7
    8
    9

## Version

Bash version used.

``` bash
bash --version
```

    GNU bash, version 5.1.16(1)-release (x86_64-pc-linux-gnu)
    Copyright (C) 2020 Free Software Foundation, Inc.
    License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>

    This is free software; you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.
