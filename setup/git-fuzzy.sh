#!/bin/zsh

set -euo pipefail

GF_DIR="$HOME/.git-fuzzy"

if [ -d "$GF_DIR" ]; then
  echo "Updating git-fuzzy..."
  git -C "$GF_DIR" pull --ff-only
else
  echo "Installing git-fuzzy..."
  git clone https://github.com/bigH/git-fuzzy.git "$GF_DIR"
fi

echo "git-fuzzy installed at $GF_DIR"
