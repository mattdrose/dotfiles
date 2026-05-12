#!/bin/zsh

# Keep strict-mode options local when this file is sourced by `dotfiles reload`.
emulate -L zsh
set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
  return 0 2>/dev/null || exit 0
fi

if ! command -v duti >/dev/null 2>&1; then
  echo "Skipping default app associations: duti is not installed. Run 'dotfiles brew' first."
  return 0 2>/dev/null || exit 0
fi

DUTI_CONFIG="$HOME/.duti"

if [[ ! -e "$DUTI_CONFIG" ]]; then
  echo "Skipping default app associations: $DUTI_CONFIG does not exist. Run 'dotfiles' first."
  return 0 2>/dev/null || exit 0
fi

DUTI_OUTPUT="$(mktemp)"
trap 'rm -f "$DUTI_OUTPUT"' EXIT

if ! duti "$DUTI_CONFIG" 2>"$DUTI_OUTPUT"; then
  cat "$DUTI_OUTPUT" >&2
  return 1 2>/dev/null || exit 1
fi

# duti can emit macOS LaunchServices error -50 for dynamic UTIs even when it
# successfully applies the file-extension association. Hide those noisy,
# non-fatal messages while preserving any other warnings/errors.
grep -vE '^failed to set .* as handler for dyn\.[^ ]+ \(error -50\)$' "$DUTI_OUTPUT" >&2 || true

echo "Default app associations configured."
