#!/usr/bin/env bash

set -euo pipefail

SCRIPTDIR=$(dirname "$0")
ROOT=$(realpath "${SCRIPTDIR}"/..)
EXT_DIR=${ROOT}/presentation/_extensions

extensions=(
   quarto-ext/pointer
   quarto-ext/attribution
   quarto-ext/fontawesome
   quarto-ext/lightbox
   quarto-ext/include-code-files
   grantmcdermott/quarto-revealjs-clean
   shafayetShafee/reveal-header
   EmilHvitworking/roughnotation
   mcanouil/quarto-revealjs-coeos
   coatless/quarto-webr
)

for ext in "${extensions[@]}"; do
   # quarto installs to _extensions/<org>/<name>
   ext_path="${EXT_DIR}/${ext}"
   if [[ -d "${ext_path}" ]]; then
      >&2 echo "Skipping ${ext} (already installed)"
      continue
   fi
   >&2 echo "Installing ${ext}..."
   "${SCRIPTDIR}"/install_quarto_ext.sh "${ext}"
done

>&2 echo "Done"
exit 0
