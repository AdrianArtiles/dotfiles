#!/bin/sh

brew tap caskroom/cask
mkdir ~/Projects

# Basic Tools
brew install neovim
brew install yarn
brew install go
brew install tree
brew install watch
brew install gpg
brew install fzf
brew install jq
brew install wifi-password
/usr/local/opt/fzf/install
brew cask install ngrok
sudo easy_install pygments

# Non-essential Tools
brew install speedtest_cli
brew cask install visual-studio-code
code --install-extension vscodevim.vim

# Chosen Technologies
brew install terraform
brew install mongodb

# Vendors and Platforms
brew install hub
brew cask install google-cloud-sdk
brew install awscli

# Global Libraries
npm install -g live-server
npm install -g tldr
npm install -g eslint
