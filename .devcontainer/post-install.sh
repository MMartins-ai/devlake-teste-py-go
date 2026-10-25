#!/usr/bin/env bash
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FBD_PROJECT="$PROJECT_ROOT/FBD_trabalho/projeto_fluxo_entrega"

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  chromium \
  latexmk \
  texlive-lang-portuguese \
  texlive-latex-base \
  texlive-latex-extra \
  texlive-latex-recommended

sudo env PUPPETEER_SKIP_DOWNLOAD=true \
  npm install --global @mermaid-js/mermaid-cli@11.16.0

if [[ -f "$PROJECT_ROOT/requirements.txt" ]]; then
  pip3 install -r "$PROJECT_ROOT/requirements.txt"
fi

if [[ -f "$FBD_PROJECT/etl/requirements.txt" ]]; then
  python3 -m venv "$FBD_PROJECT/etl/.venv"
  "$FBD_PROJECT/etl/.venv/bin/pip" install \
    -r "$FBD_PROJECT/etl/requirements.txt"
fi
