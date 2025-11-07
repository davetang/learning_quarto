FROM rocker/tidyverse:4.5.0

LABEL \
    maintainer="Dave Tang <me@davetang.org>" \
    org.opencontainers.image.authors="Dave Tang <me@davetang.org>" \
    org.opencontainers.image.source="https://github.com/davetang/learning_quarto" \
    org.opencontainers.image.licenses="Creative Commons Zero v1.0 Universal"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get clean all && \
   apt-get update && \
   apt-get upgrade -y && \
   apt-get install -y \
      libssl-dev \
      libxml2-dev \
      libpng-dev \
      libbz2-dev \
      liblzma-dev \
      zlib1g-dev \
      libncurses-dev \
      ncurses-term \
      unzip \
      vim \
      pigz \
      wget \
      libxt6 \
      python3-pip \
      python3 \
      python3-venv \
   && apt-get clean all && \
   apt-get purge && \
   rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ARG ver=1.8.25
RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v${ver}/quarto-${ver}-linux-amd64.deb && \
   apt install ./quarto-${ver}-linux-amd64.deb && \
   quarto --version && \
   rm ./quarto-${ver}-linux-amd64.deb

USER rstudio
WORKDIR /home/rstudio
ENV PATH="/home/rstudio/venv/bin:${PATH}"

RUN python3 -m venv /home/rstudio/venv && \
    . /home/rstudio/venv/bin/activate && \
    pip install --no-cache-dir marimo jupyter

ENTRYPOINT ["quarto"]
