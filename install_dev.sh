#!/bin/sh

brew tap caskroom/cask
brew tap homebrew/cask-fonts

# Basic Tools
brew install neovim
brew install pnpm
brew install oven-sh/bun/bun
brew install zsh-history-substring-search
brew install go
brew install tree
brew install watch
brew install gnupg
brew install fzf
brew install ripgrep
brew install fd
brew install jq
brew install yq
brew install fx
brew install bat
brew install eza
brew install cloc
brew install zoxide
brew install ffmpeg
brew install shred
brew install ipfs
brew install p7zip
brew install imagemagick
# brew install midnight-commander
# brew install btop
brew install htop
brew install tldr
brew install jesseduffield/lazygit/lazygit
brew install jesseduffield/lazydocker/lazydocker
brew install gnu-sed
brew install moreutils
brew install restic
brew install rsync
brew install rclone
brew install git-lfs

# Additional Tools
brew install koekeishiya/formulae/yabai
# brew install koekeishiya/formulae/skhd
# brew install --cask amethyst
# brew install --cask ubersicht
brew install FelixKratz/formulae/sketchybar
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.19/sketchybar-app-font.ttf -o "$HOME/Library/Fonts/sketchybar-app-font.ttf"
# brew services start felixkratz/formulae/sketchybar
brew install --cask wezterm
# brew install --cask alacritty
# brew install --cask kitty
# brew install pjproject
brew install speedtest_cli
brew install --cask visual-studio-code
brew install --cask charles
brew install mitmproxy
# brew install http-server # using http-serve from prezto instead
brew install --cask ngrok
brew install --cask redisinsight
brew install --cask font-jetbrains-mono-nerd-font
code --install-extension vscodevim.vim
brew install --cask cursor
brew install clamav
brew install mailsy
brew install qrencode
brew install dust
brew install --cask insomnia
brew install hasura-cli
brew install hashicorp/tap/terraform
brew install gitleaks
brew install neofetch
brew install broot
brew install ranger
brew install yazi
brew install ffmpegthumbnailer # trialing yazı dependency
brew install unar # trialing yazı dependency
brew install poppler # trialing yazı dependency
brew install exiftool # trialing yazı dependency
brew install trash
# brew install dog
# brew install doggo
brew install poppler # trialing
brew install ncdu # trialing
brew install duf # trialing
brew install peco # trialing
brew install colordiff # trialing

# Vendors and Platforms
brew install gh
brew install --cask docker
brew install --cask orbstack
brew install --cask google-cloud-sdk
brew install awscli
brew install CrunchyData/brew/cb
brew install tursodatabase/tap/turso
brew install rover
brew install stripe/stripe-cli/stripe
brew install railway
brew install flyctl
