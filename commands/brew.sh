#!/bin/zsh

set -euo pipefail

if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  brew update
fi

brew upgrade

brew bundle --file="${DOTFILES:-$HOME/dotfiles}/Brewfile"

# nvm (recommended install method per nvm maintainers, not via Homebrew)
if [ ! -d "$HOME/.nvm" ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
fi

# git-fuzzy (requires fzf from Brewfile)
source "${DOTFILES:-$HOME/dotfiles}/commands/git-fuzzy.sh"

brew cleanup
