#!/usr/bin/env bash

set -euo pipefail

IMAGE=quarto
VER=$(grep "^FROM" Dockerfile | cut -d':' -f2)
if [[ -z "${VER}" ]]; then
  >&2 echo "VER is not set"
  exit 1
fi

docker build -t davetang/${IMAGE}:"${VER}" .

>&2 echo Build complete
>&2 echo -e "Run the following to push to Docker Hub:\n"
>&2 echo docker login
>&2 echo docker push davetang/${IMAGE}:"${VER}"

exit 0
