#!/bin/zsh

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install CLI tools
brew install git-completion
brew install gh
brew install nvm

# Install GUI tools
brew install --cask rectangle
brew install --cask karabiner-elements
brew install --cask tuple
brew install --cask smoothscroll
brew install --cask alfred
brew install --cask 1password
brew install --cask google-drive
brew install --cask beardedspice

# Remove outdated versions from the cellar.
brew cleanup
