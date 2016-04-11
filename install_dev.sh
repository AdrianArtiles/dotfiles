#!/bin/sh

brew tap caskroom/cask
mkdir ~/Projects

# Basic Tools
brew install go
brew install tree
brew install watch
brew install fzf
/usr/local/opt/fzf/install
brew cask install ngrok

# Non-essential Tools
brew install speedtest_cli

# Chosen Technologies
brew install terraform
brew install ansible

# Global Libraries
npm install nodebootstrap -g
