# Bash commands in Quarto
2023-08-24

- [Hello, World](#hello-world)
- [Loops](#loops)
- [Version](#version)

Generating [GitHub Flavoured
Markdown](https://quarto.org/docs/output-formats/gfm.html) (GFM); see
[GFM
Options](https://quarto.org/docs/reference/formats/markdown/gfm.html).

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

<!-- If I do not include a R code block, Jupyter Notebook is used and the
document does not render properly. -->
