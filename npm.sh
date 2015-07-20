#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install nvm
brew install nvm

mkdir ~/.nvm

cp $(brew --prefix nvm)/nvm-exec ~/.nvm/

# Source nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

#Install latest
nvm install

# Install Grunt CLI
npm install -g grunt-cli

# Install Gulp
npm install -g gulp

# Install Bower
npm install -g bower
