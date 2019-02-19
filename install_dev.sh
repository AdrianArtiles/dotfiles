#!/bin/sh

brew tap caskroom/cask
mkdir ~/Projects

# Basic Tools
brew install yarn
brew install go
brew install tree
brew install watch
brew install gpg
brew install fzf
brew install aspell
brew install jq
/usr/local/opt/fzf/install
brew cask install ngrok
sudo easy_install pygments

# Non-essential Tools
brew install speedtest_cli
brew cask install postico
brew cask install robo-3t

# Chosen Technologies
brew install terraform
brew install mongodb

# Vendors and Platforms
brew install hub
brew install kops
brew cask install google-cloud-sdk
brew install awscli

# Global Libraries
npm install -g live-server
npm install -g tldr
npm install -g eslint
