#!/bin/zsh
# ========================================
# ZSH Configuration
# ========================================

# ========================================
# Shell Options
# ========================================

# Completion options

setopt EXTENDED_GLOB        # Needed for file modification glob modifiers with compinit.
unsetopt FLOW_CONTROL       # Disable start/stop characters in shell editor.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.
setopt ALWAYS_TO_END        # Move cursor to the end of a completed word.
setopt AUTO_MENU            # Show completion menu on a successive tab press.

# General shell options
setopt INTERACTIVE_COMMENTS # Allow comments in interactive shells
unsetopt CLOBBER            # Prevent overwriting files with > redirect
setopt AUTO_CD              # Change directory without typing cd

# ========================================
# History Configuration
# ========================================

# export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history"
export HISTSIZE=10000
export SAVEHIST=10000
setopt EXTENDED_HISTORY      # Record timestamp of command in HISTFILE
setopt SHARE_HISTORY         # Share history between all sessions
setopt HIST_IGNORE_DUPS      # Don't record entry if duplicate of previous
setopt HIST_IGNORE_SPACE     # Don't record entry starting with space
setopt HIST_VERIFY           # Show command with history expansion before running

# ========================================
# Environment Variables
# ========================================

# Editor and pager configuration
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export GPG_TTY=`tty`

# Path configuration
export PATH="$HOME/.local/bin:$PATH"

# Tool initializations
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(navi widget zsh)"
eval "$(mise activate zsh)"

# ========================================
# Completion System
# ========================================

# Initialize completions
autoload -Uz compinit
# Only regenerate compdump once a day for performance
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# Completion styles - Defaults
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# Use caching to make completion for commands such as dpkg and apt usable
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompcache"

# Group matches and describe
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# Fuzzy match mistyped completions
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
# Increase the number of errors based on the length of the typed word
# Cap at 7 max-errors to avoid hanging
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'

# Don't complete unavailable commands
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

# Array completion element sorting
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Directory completion
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true

# History completion
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# Environment variables completion
zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}

# ========================================
# Plugins
# ========================================

# Load plugins with error handling
[[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

[[ -f /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh ]] && \
  source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# Load syntax highlighting last for optimal performance
[[ -f /opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]] && \
  source /opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# ========================================
# Prompt Configuration
# ========================================

setopt PROMPT_SUBST
PROMPT='
%F{green}%*%f %F{blue}%~%f
%% '

# Alternative prompt with git info (commented out)
# PROMPT='
# %F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f
# %% '

# ========================================
# Key Bindings
# ========================================

bindkey -v                   # Use vi mode
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^b' backward-word
bindkey '^f' forward-word

# ========================================
# Aliases
# ========================================

# Git aliases
alias git='noglob git'       # Remove zsh globbing for git
alias gitd="git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"
alias editd="cd ~; GIT_DIR=~/.dotfiles.git $EDITOR"
alias 'git?'='gh copilot suggest -t git'

# File operations
alias ccat='bat -pp'         # Use bat as a better cat
alias ll='eza --all --group-directories-first --header --long'

# Copilot aliases
alias '??'='gh copilot suggest -t shell'
alias explain='gh copilot explain'

# Shortcuts
alias cdd='cd ~/Desktop'
alias lg='lazygit'
alias tararchive='tar -cJvf archive.tar.xz'
alias vd='visidata --theme=asciimono'
alias aic='aichat --session'
alias http-serve='python -m http.server'

# ========================================
# Functions
# ========================================

# Auto-ls when changing directories
chpwd() {
  ll
}

# ----------------------------------------
# Navigation and File Tools
# ----------------------------------------

# yy - yazi wrapper to change directory to the yazi cwd
yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Yazi integration for nested sessions
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

# Load a .env file into the current shell
load_env() {
  set -o allexport && source .env && set +o allexport
}

# ----------------------------------------
# Bookmarking System
# ----------------------------------------

# m - mark a directory to easily jump to it later with j
m() {
  if [ -z "$1" ]; then
    echo "You must provide a mark"
    return 1
  fi

  local bookmarks_dir="${XDG_STATE_HOME:-$HOME/.local/state}/bookmarks"
  if [ ! -d "$bookmarks_dir" ]; then
    mkdir -p "$bookmarks_dir"
  fi

  echo "$1: $PWD"
  echo $PWD >| "$bookmarks_dir/$1"
}

# j - jump to a marked directory
j() {
  if [ -z "$1" ]; then
    echo "You must provide a mark"
    return 1
  fi
  local bookmarks_dir="${XDG_STATE_HOME:-$HOME/.local/state}/bookmarks"
  if [ ! -f "$bookmarks_dir/$1" ]; then
    echo "mark $1 does not exist"
    return 1
  fi
  dir=$(cat "$bookmarks_dir/$1")
  echo $dir
  cd $dir
}

# marks - list all the marks
marks() {
  local bookmarks_dir="${XDG_STATE_HOME:-$HOME/.local/state}/bookmarks"
  for bookmark in "$bookmarks_dir"/*; do
    [[ -f "$bookmark" ]] && echo "$(basename "$bookmark"): $(cat "$bookmark")"
  done
}

# ----------------------------------------
# Tmux Tools
# ----------------------------------------

# tms - tmux session manager to create or attach to a session
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

# Completion for tms function
_tms() {
  local sessions
  sessions=($(tmux list-sessions 2>/dev/null | cut -d: -f1))
  _describe 'sessions' sessions
}
compdef _tms tms

# ----------------------------------------
# DNS Tools
# ----------------------------------------

# adig - a simple dig wrapper to get main DNS records
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
nameserver_check() {
  host -t NS -W 2 $1
}

# whois_check - query whois for a domain and check if it's available
# Note: only shows domains that are not found
whois_check() {
  whois $1 | grep --color=never -i 'no match\|not found'
}

# ========================================
# Setup and Initialization
# ========================================

# Setup function for new environments
run_setup() {
  echo "Installing homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

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

# Check if setup is needed
if [ ! -f ~/.local/share/dictionaries/words.txt ]; then
  echo "Please run run_setup"
fi

# ========================================
# Local Configuration
# ========================================

# Source local configuration if it exists
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
