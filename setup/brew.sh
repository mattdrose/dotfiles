#!/bin/zsh

# Ask for the administrator password upfront
sudo -v

# Make sure we’re using the latest Homebrew.
if ! command -v brew &> /dev/null
then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  brew update
fi

# Upgrade any already-installed formulae.
brew upgrade

# Install CLI tools
brew install git-completion
brew install gh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Install GUI tools
brew install --cask rectangle
brew install --cask karabiner-elements
brew install --cask smoothscroll
brew install --cask raycast
brew install --cask 1password
brew install --cask google-drive
brew install --cask beardedspice
brew install --cask spotify
brew install --cask visual-studio-code
brew install --cask google-chrome

# Remove outdated versions from the cellar.
brew cleanup
