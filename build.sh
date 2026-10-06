#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "$0")" && pwd)"

cd "$repo_root"
git pull --ff-only

cd "$repo_root/draft"

latexmk -C main.tex
rm -f main.bcf main.bcf-SAVE-ERROR main.bbl-SAVE-ERROR

latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex
