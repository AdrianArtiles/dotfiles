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
# curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
git clone https://github.com/creationix/nvm.git ~/.nvm
cd ~/.nvm && git checkout v0.33.6

# Non-essential Tools
brew install speedtest_cli
brew cask install postico
brew cask install robo-3t
npm install -g commitizen

# Chosen Technologies
brew install terraform
brew install mongodb

# Vendors and Platforms
brew install hub
brew install kops
brew cask install google-cloud-sdk
npm install -g netlify-cli
npm install -g now

# Global Libraries
npm install -g live-server
npm install -g project-name-generator
npm install -g create-react-app
npm install -g create-next-app
npm install -g express-generator
npm install -g spike
npm install -g gatsby-cli
npm install -g feathers-cli
npm install -g serverless
npm install -g eslint
