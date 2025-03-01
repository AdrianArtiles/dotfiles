
zstyle ':prezto:load' pmodule \
  'environment' \
  'editor' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'archive' \
  'git' \
  'osx' \
  'ssh' \
  'completion' \
  'syntax-highlighting' \
  'history-substring-search' \
  'autosuggestions' \
  'prompt'
zstyle ':prezto:module:syntax-highlighting' highlighters \
  'main' \
  'brackets' \
  'pattern' \
  'line' \
  'cursor' \
  'root'
zstyle ':prezto:*:*' color 'yes'
zstyle ':prezto:*:*' case-sensitive 'no'
zstyle ':prezto:module:editor' key-bindings 'vi'
zstyle ':prezto:module:history-substring-search' unique 'yes'
zstyle ':prezto:module:history-substring-search' fuzzy 'yes'
zstyle ':prezto:module:prompt' theme 'pure'
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

autoload -U compinit
compinit

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(navi widget zsh)"
fpath=(${ASDF_DIR}/completions $fpath)
export PATH="$HOME/.local/bin:$PATH"
source $(brew --prefix asdf)/libexec/asdf.sh

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export GPG_TTY=`tty`

bindkey -v
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^b' backward-word
bindkey '^f' forward-word

# Remove zsh globbing for git so commands like `git add *` work as expected
alias git='noglob git'
# Manage dotfiles with a bare git repository
alias gitd="git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"
alias editd="cd ~; GIT_DIR=~/.dotfiles.git $EDITOR"
# Use bat as a better cat
alias ccat='bat -pp'
# Use exa as a better ls
alias ll='eza --all --group-directories-first --header --long'
# Copilot aliases
alias '??'='gh copilot suggest -t shell'
alias 'git?'='gh copilot suggest -t git'
alias explain='gh copilot explain'
# Shortcuts
alias cdd='cd ~/Desktop'
alias lg='lazygit'
alias tararchive='tar -cJvf archive.tar.xz'

# advanced ls when in new directory
chpwd() {
  ll
}










# Navigation and file tools

# yy - yazi wrapper to change directory to the yazi cwd
yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
if [[ -n "$YAZI_ID" ]]; then
  echo "Yazi ID: $YAZI_ID"
	function _yazi_cd() {
		ya emit cd "$PWD"
	}
	add-zsh-hook zshexit _yazi_cd
fi

# zf - custom fzf + zoxide function to easily jump to frequently or recently used directories
zf() {
  cd "$(zoxide query --list --score | fzf --height 40% --layout reverse --info inline --border --preview "eza --all --group-directories-first --header --long --no-user --no-permissions --color=always {2}" --no-sort | awk '{print $2}')"
}











# Marking and jumping to directories

# m - mark a directory to easily jump to it later with j
# Usage: m <mark name>
m() {
  if [ -z "$1" ]; then
    echo "You must provide a mark"
    return 1
  fi

  if [ ! -d ~/.local/state/bookmarks ]; then
    mkdir -p ~/.local/state/bookmarks
  fi

  echo "$1: $PWD"
  echo $PWD >| ~/.local/state/bookmarks/$1
}

# j - jump to a marked directory
# Usage: j <mark name>
j() {
  if [ -z "$1" ]; then
    echo "You must provide a mark"
    return 1
  fi
  if [ ! -f ~/.local/state/bookmarks/$1 ]; then
    echo "mark $1 does not exist"
    return 1
  fi
  dir=$(cat ~/.local/state/bookmarks/$1)
  echo $dir
  cd $dir
}

# marks - list all the marks
marks() {
  for bookmark in ~/.local/state/bookmarks/*; do
    echo "$(basename $bookmark): $(cat $bookmark)"
  done
}










# Tmux tools

# tms - tmux session manager to create or attach to a session
# Usage: tms <session name>
tms() {
  if [ -z "$1" ]; then
    echo "Please provide a session name"
    return 1
  fi

  tmux has-session -t="$1" 2>/dev/null
  if [ $? -eq 0 ]; then
    tmux attach -t "$1"
  else
    tmux new -s "$1"
  fi
}
_tms() {
  local sessions
  sessions=($(tmux list-sessions 2>/dev/null | cut -d: -f1))
  _describe 'sessions' sessions
}
compdef _tms tms










# DNS tools

# adig - a simple dig wrapper to get main DNS records
# Usage: adig <domain>
adig() {
  local domain=$1;
  local types;
        types=(soa ns a aaaa cname ds dnskey rrsig nsec txt mx);

  for t in "${types[@]}"; do
    dig "$domain" -t "$t" \
      | sed -n '/;; ANSWER SECTION/,/^$/p' \
      | sed '1d' \
      | sed '/^$/d';
  done
}

# nameserver_check - check the nameservers for a domain
# Usage: nameserver_check <domain>
nameserver_check() {
  host -t NS -W 2 $1
}

# whois_check - query whois for a domain and check if it's available
# Usage: whois_check <domain>
# Note: only shows domains that are not found
whois_check() {
  whois $1 | grep --color=never -i 'no match\|not found'
}










additional_setup() {
  echo "Setting up additional directories"
  mkdir -p ~/Areas
  mkdir -p ~/Resources
  mkdir -p ~/Archives
  mkdir -p ~/.local/share/dictionaries

  echo "Downloading additional files"
  curl -s https://raw.githubusercontent.com/bitcoin/bips/master/bip-0039/english.txt -o ~/.local/share/dictionaries/words.txt
  curl -s http://cheat.sh/:list -o ~/.local/share/dictionaries/cheat.sh.txt
  curl -s -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.28/sketchybar-app-font.ttf -o ~/Library/Fonts/sketchybar-app-font.ttf

  echo "Additional setup complete"
}
if [ ! -f ~/.local/share/dictionaries/words.txt ]; then
  echo "Please run additional_setup"
fi

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
