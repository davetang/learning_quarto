FROM rocker/tidyverse:4.3.1

MAINTAINER Dave Tang <me@davetang.org>

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
   && apt-get clean all && \
   apt-get purge && \
   rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ARG ver=1.3.450
RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v${ver}/quarto-${ver}-linux-amd64.deb && \
   apt install ./quarto-${ver}-linux-amd64.deb && \
   rm ./quarto-${ver}-linux-amd64.deb

RUN python3 -m pip install jupyter

ENTRYPOINT ["quarto"]
