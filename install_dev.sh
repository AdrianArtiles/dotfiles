#!/bin/sh

brew tap caskroom/cask
brew tap homebrew/cask-fonts

# Main
brew install neovim
brew install --cask wezterm
# brew install --cask alacritty
# brew install --cask kitty
brew install --cask font-jetbrains-mono-nerd-font

# Main 2
brew install zsh-history-substring-search
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
brew install gnu-sed
brew install moreutils
brew install tldr
brew install colordiff # trialing

# File Managers
brew install yazi
# brew install midnight-commander
# brew install broot
# brew install ranger

# File Tools
brew install restic
brew install rsync
brew install rclone
brew install ipfs
brew install shred
brew install clamav
brew install dust # disk usage - trialing
brew install ncdu # disk usage - trialing
brew install duf # disk usage - trialing
brew install unar # unarchive - trialing
brew install trash
brew install p7zip

# UI
brew install koekeishiya/formulae/yabai
# brew install koekeishiya/formulae/skhd
# brew install --cask amethyst
# brew install --cask ubersicht
brew install FelixKratz/formulae/sketchybar
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.19/sketchybar-app-font.ttf -o "$HOME/Library/Fonts/sketchybar-app-font.ttf"
# brew services start felixkratz/formulae/sketchybar
# brew services start yabai
# brew services start sketchybar
# brew install stats

# Untitled
brew install pnpm
brew install oven-sh/bun/bun
brew install htop
# brew install btop
brew install jesseduffield/lazygit/lazygit
brew install jesseduffield/lazydocker/lazydocker
brew install --cask charles
brew install mitmproxy
# brew install http-server # using http-serve from prezto instead
brew install --cask ngrok
brew install git-lfs
brew install speedtest_cli
brew install ffmpeg
brew install imagemagick
# brew install pjproject
brew install --cask visual-studio-code
code --install-extension vscodevim.vim
brew install --cask redisinsight
brew install --cask cursor
brew install --cask insomnia
brew install mailsy
brew install qrencode
brew install gitleaks
brew install fastfetch
brew install ffmpegthumbnailer # trialing yazı dependency
brew install poppler # trialing yazı dependency
brew install exiftool # trialing yazı dependency
# brew install dog
# brew install doggo
brew install peco # trialing

# OSS
brew install hasura-cli
brew install hashicorp/tap/terraform
brew install --cask docker
brew install --cask orbstack
brew install tursodatabase/tap/turso

# Vendors and Platforms
brew install gh
brew install --cask google-cloud-sdk
brew install awscli
brew install CrunchyData/brew/cb
brew install rover
brew install stripe/stripe-cli/stripe
brew install railway
brew install flyctl
