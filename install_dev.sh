#!/bin/sh

brew tap caskroom/cask
brew tap elastic/tap
brew tap homebrew/cask-fonts
brew tap oven-sh/bun
mkdir ~/Projects

# Basic Tools
brew install neovim
# brew install yarn
brew install bun
brew install pnpm
brew install go
brew install tree
brew install watch
brew install gpg
brew install fzf
brew install ripgrep
brew install fasd
brew install fd
brew install jq
brew install fx
brew install bat
brew install exa
brew install cloc
brew install qrencode
brew install wifi-password
brew install ffmpeg
brew install shred
brew install http-server
brew install git-gui
brew install --cask ngrok
brew install ipfs
brew install p7zip

$(brew --prefix)/opt/fzf/install

# Install Neo/Vim Plugin Manager
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Non-essential Tools
brew install pjproject
brew install speedtest_cli
brew install --cask visual-studio-code
brew install --cask runjs
brew install --cask altair-graphql-client
brew install --cask http-toolkit
brew install --cask charles
brew install mitmproxy
# brew install --cask another-redis-desktop-manager
brew install --cask redisinsight
brew install --cask font-jetbrains-mono-nerd-font
code --install-extension vscodevim.vim
brew install --cask cursor
brew install clamav

# Chosen Technologies
brew install neovim
brew install hasura-cli
brew install terraform
# brew install mongodb
# brew install elastic/tap/elasticsearch-full
# brew install elastic/tap/kibana-full

# Vendors and Platforms
brew install gh
brew install --cask docker
brew install --cask google-cloud-sdk
brew install awscli
brew install CrunchyData/brew/cb
brew install rover
brew install stripe/stripe-cli/stripe
brew install railway
brew install flyctl

# Global Libraries
npm install -g live-server
npm install -g tldr
npm install -g eslint
