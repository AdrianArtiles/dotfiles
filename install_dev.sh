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
/usr/local/opt/fzf/install
brew cask install ngrok
sudo easy_install pygments
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash

# Non-essential Tools
brew cask install atom
brew install speedtest_cli
brew cask install postico
brew cask install robomongo
npm install commitizen -g

# Chosen Technologies
brew install terraform
brew install mongodb

# Vendors and Platforms
brew install hub
brew install kops
brew install aws-elasticbeanstalk
brew cask install google-cloud-sdk
npm install -g netlify-cli
npm install -g now

# Global Libraries
npm install -g live-server
npm install -g create-react-app
npm install -g express-generator
