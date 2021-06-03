#!/bin/sh

brew tap caskroom/cask
brew tap elastic/tap
mkdir ~/Projects

# Basic Tools
brew install neovim
brew install yarn
brew install go
brew install tree
brew install watch
brew install gpg
brew install fzf
brew install fasd
brew install fd
brew install jq
brew install bat
brew install exa
brew install cloc
brew install wifi-password
brew install ffmpeg
/usr/local/opt/fzf/install
brew install --cask ngrok
brew install ipfs

# Install Neo/Vim Plugin Manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Non-essential Tools
brew install pjproject
brew install speedtest_cli
brew install --cask visual-studio-code
brew install --cask runjs
code --install-extension vscodevim.vim

# Chosen Technologies
brew install terraform
brew install mongodb
brew install elastic/tap/elasticsearch-full
brew install elastic/tap/kibana-full                                                                         ✘ 130

# Vendors and Platforms
brew install hub
brew install --cask google-cloud-sdk
brew install awscli
brew install stripe/stripe-cli/stripe

# Global Libraries
npm install -g live-server
npm install -g tldr
npm install -g eslint
npm install -g neovim
