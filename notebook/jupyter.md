# Using the Jupyter engine with Docker

- [Python Hello, World](#python-hello-world)
- [Shell Hello, World](#shell-hello-world)
- [Environmental variables](#environmental-variables)
- [Version](#version)

I created a Quarto Docker image for executing my Quarto documents. This
works fine (so far) when using the Knitr engine but fails when using the
Jupyter engine.

    Starting python3 kernel.../usr/local/lib/python3.10/dist-packages/IPython/paths.py:69: UserWarning: IPython parent '/' is not a writable location, using a temp directory.
      warn("IPython parent '{0}' is not a writable location,"
    /usr/local/lib/python3.10/dist-packages/IPython/paths.py:69: UserWarning: IPython parent '/' is not a writable location, using a temp directory.
      warn("IPython parent '{0}' is not a writable location,"
    Done

After searching online it seems that the problem is that the `HOME`
environment variable is not correctly set. Adding the
`--env HOME=$(pwd)` gets rid of the error above but the code output is
not included.

There is a [GitHub
issue](https://github.com/quarto-dev/quarto-cli/issues/3203) showing the
Bash output is not executed but that may be because [more than one type
of
code](https://github.com/quarto-dev/quarto-cli/issues/3203#issuecomment-1305371192)
was present. This does not explain my case since I only have Bash code.

It turns out that I need to use [Jupyter shell
magics](https://quarto.org/docs/computations/execution-options.html#shell-commands),
which is prepending an exclamation mark in front of my shell command.

## Python Hello, World

``` python
print("Hello, World")
```

    Hello, World

## Shell Hello, World

``` python
!echo Hello, World
```

    Hello, World

## Environmental variables

SHELL environmental variable.

``` python
!echo $SHELL
```

All environmental variables.

``` python
!env
```

    MPLBACKEND=module://matplotlib_inline.backend_inline
    HOSTNAME=249bca81d60f
    S6_VERSION=v2.1.0.2
    QUARTO_FIG_HEIGHT=5
    SHLVL=1
    XDG_CACHE_HOME=/tmp/quarto_cache_home
    HOME=/home/dtang/github/learning_quarto
    QUARTO_ROOT=/
    PAGER=cat
    R_VERSION=4.3.1
    DENO_NO_UPDATE_CHECK=1
    RSTUDIO_VERSION=2023.06.0+421
    FORCE_COLOR=1
    QUARTO_DENO=/opt/quarto/bin/tools/deno-x86_64-unknown-linux-gnu/deno
    _=/opt/quarto/bin/tools/deno-x86_64-unknown-linux-gnu/deno
    QUARTO_FIG_DPI=96
    TERM=xterm-color
    QUARTO_FIG_FORMAT=png
    PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
    QUARTO_SHARE_PATH=/opt/quarto/share
    PANDOC_VERSION=default
    DENO_DIR=deno-x86_64-unknown-linux-gnu
    QUARTO_BIN_PATH=/opt/quarto/bin
    LANG=en_US.UTF-8
    XDG_DATA_HOME=/tmp/quarto_data_home
    QUARTO_FIG_WIDTH=7
    DEBIAN_FRONTEND=noninteractive
    CLICOLOR_FORCE=1
    DEFAULT_USER=rstudio
    R_HOME=/usr/local/lib/R
    GIT_PAGER=cat
    PWD=/home/dtang/github/learning_quarto/notebook
    CLICOLOR=1
    JPY_PARENT_PID=41
    PYDEVD_USE_FRAME_EVAL=NO
    DENO_DOM_PLUGIN=/opt/quarto/bin/tools/deno_dom/libplugin.so
    TZ=Etc/UTC
    CRAN=https://packagemanager.posit.co/cran/__linux__/jammy/latest
    QUARTO_VERSION=default

## Version

Bash version used.

``` python
!bash --version
```

    GNU bash, version 5.1.16(1)-release (x86_64-pc-linux-gnu)
    Copyright (C) 2020 Free Software Foundation, Inc.
    License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>

    This is free software; you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.
