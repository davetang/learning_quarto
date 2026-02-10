#!/usr/bin/env bash

set -euo pipefail

usage(){
   echo "Usage: $0 <extension>"
   echo ""
   echo "Install a Quarto extension into presentation/_extensions."
   echo ""
   echo "Examples:"
   echo "  $0 quarto-ext/pointer"
   echo "  $0 quarto-ext/fontawesome"
   exit 1
}

if [[ $# -lt 1 ]]; then
   usage
fi

extension=$1

check_depend (){
   tool=$1
   if [[ ! -x $(command -v ${tool}) ]]; then
     >&2 echo Could not find ${tool}
     exit 1
   fi
}

dependencies=(docker)
for tool in ${dependencies[@]}; do
   check_depend ${tool}
done

SCRIPTDIR=$(dirname "$0")
ROOT=$(realpath "${SCRIPTDIR}"/..)
PRES_DIR=${ROOT}/presentation

VER=4.5.0
IMAGE=davetang/quarto:${VER}

docker run \
   --rm \
   --env DENO_DIR=/tmp/quarto_deno_cache_home \
   --env XDG_CACHE_HOME=/tmp/quarto_cache_home \
   --env XDG_DATA_HOME=/tmp/quarto_data_home \
   -v "${PRES_DIR}":/work \
   -w /work \
   -u "$(id -u):$(id -g)" \
   ${IMAGE} \
   quarto add "${extension}" --no-prompt

>&2 echo "Installed ${extension} into presentation/_extensions"
exit 0
