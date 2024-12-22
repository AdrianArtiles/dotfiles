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
brew install htmlq # trialing
brew install bat
brew install eza
brew install cloc
brew install zoxide
brew install gnu-sed
brew install moreutils
brew install tldr
brew install colordiff # trialing
brew install difftastic
brew install miller
brew install saulpw/vd/visidata
# brew install xsv
# brew install sc-im
# brew install csvtk
brew install mise
# curl -s https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh && sudo chmod +x /usr/local/bin/cht.sh # trialing
brew install navi
brew install bruno # api client - trialing
brew install wget

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
# brew install koekeishiya/formulae/yabai
# brew install koekeishiya/formulae/skhd
# brew install --cask amethyst
# brew install --cask ubersicht
brew install FelixKratz/formulae/sketchybar
# brew services start felixkratz/formulae/sketchybar
# brew services start yabai
# brew services start sketchybar
# brew install stats

# Untitled
brew install pnpm
brew install oven-sh/bun/bun
brew install deno
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
brew install --cask redisinsight
brew install --cask cursor
brew install --cask insomnia
brew install mailsy
brew install qrencode
brew install gitleaks
brew install fastfetch
brew install ffmpegthumbnailer # trialing yazi dependency
brew install poppler # trialing yazi dependency
brew install exiftool # trialing yazi dependency
# brew install dog
# brew install doggo

# OSS
brew install hasura-cli
brew install hashicorp/tap/terraform
brew install --cask docker
brew install --cask orbstack
brew install tursodatabase/tap/turso
# brew install --cask dbeaver-community

# Vendors and Platforms
brew install gh
brew install --cask google-cloud-sdk
brew install awscli
brew install CrunchyData/brew/cb
brew install rover
brew install stripe/stripe-cli/stripe
brew install railway
brew install flyctl
