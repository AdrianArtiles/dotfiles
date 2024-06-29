
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

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
fpath=(${ASDF_DIR}/completions $fpath)
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

# Don't try to glob with zsh so you can do
# stuff like ga *foo* and correctly have
# git add the right stuff
alias git='noglob git'

alias cda='cd ~/Areas'
alias cdd='cd ~/Desktop'
alias ccat='bat -pp'
# alias nscheck='host -t NS -W 2'
alias random_words='shuf -n 10 ~/computer/local/words.txt'
# alias mc='source /opt/homebrew/Cellar/midnight-commander/4.8.31/libexec/mc/mc-wrapper.sh'
alias lg='lazygit'
alias le='eza --all --group-directories-first --header --long'
alias '??'='gh copilot suggest -t shell'
alias 'git?'='gh copilot suggest -t git'
alias 'explain'='gh copilot explain'
alias tat="tmux attach -t "
alias tns="tmux new -s "
source $HOME/computer/local/misc.zsh

mkdir -p ~/computer/local
if [ ! -f ~/computer/local/words.txt ]; then
  curl -s https://raw.githubusercontent.com/bitcoin/bips/master/bip-0039/english.txt -o ~/computer/local/words.txt
fi

# advanced ls when in new directory
chpwd() {
  le
}

export nscheck() {
 host -t NS -W 2 $1
}

# custom fzf + zoxide function to easily jump to frequently or recently used directories
zf() {
  cd "$(zoxide query --list --score | fzf --height 40% --layout reverse --info inline --border --preview "eza --all --group-directories-first --header --long --no-user --no-permissions --color=always {2}" --no-sort | awk '{print $2}')"
}

# custom adig command
_dig() {
  local domain=$1;
  local type=$2;

  dig "$domain" -t "$type" \
    | sed -n '/;; ANSWER SECTION/,/^$/p' \
    | sed '1d' \
    | sed '/^$/d';
}
adig() {
  local domain=$1;
  local types;
        types=(soa ns a aaaa cname ds dnskey rrsig nsec txt mx);

  for t in "${types[@]}"; do
    _dig "$domain" "$t"
  done
}

# custom whois check
wicheck() {
  whois $1 | grep --color=never -i 'no match\|not found'
}

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
		ya pub "$YAZI_ID" dds-cd --str "$PWD"
	}
	add-zsh-hook zshexit _yazi_cd
fi

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

marks() {
  for bookmark in ~/.local/state/bookmarks/*; do
    echo "$(basename $bookmark): $(cat $bookmark)"
  done
}
