#!/bin/bash

set -e
shopt -s extglob nullglob globstar

WD=$(mktemp -d)

if [[ ! "$WD" || ! -d "$WD" ]]; then
  echo "[ERROR] Could not create temp dir."
  exit 1
fi

function cleanup {
  rm -rf "$WD"
  echo "[INFO] Deleted temp working directory $WD."
}

trap cleanup EXIT

REPO=git@github.com:fcambus/spleen.git

cd $WD
git clone $REPO
cd spleen
FONTFILES=(*.bdf)
opentype-bitmap.py ${FONTFILES[*]} >/dev/null 2>&1
mkdir -p ${HOME}/.local/share/fonts
cp *.otb ${HOME}/.local/share/fonts
fc-cache -f -v
cd -
