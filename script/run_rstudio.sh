#!/usr/bin/env bash

set -euo pipefail

VER=4.5.0
IMAGE=davetang/quarto:${VER}
NAME=rstudio_quarto_${VER}
PORT=7997
SCRIPTDIR=$(dirname "$0")
ROOT=$(realpath "${SCRIPTDIR}"/..)
DIR=${ROOT}/r_packages_${VER}

if [[ ! -d ${DIR} ]]; then
   mkdir "${DIR}"
fi

docker run -d \
   --rm \
   -p ${PORT}:8787 \
   --name ${NAME} \
   -v "${DIR}":/packages \
   -v "${ROOT}":/home/rstudio/learning_quarto \
   -e PASSWORD=password \
   -e USERID="$(id -u)" \
   -e GROUPID="$(id -g)" \
   ${IMAGE}

>&2 echo ${NAME} listening on port ${PORT}
exit 0
