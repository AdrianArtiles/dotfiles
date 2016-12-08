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
sudo easy_install pygments

# Non-essential Tools
brew install speedtest_cli

# Chosen Technologies
brew install terraform
brew install ansible
brew install mongodb

# Vendors and Platforms
brew install kops
brew install aws-elasticbeanstalk

# Global Libraries
npm install -g live-server
