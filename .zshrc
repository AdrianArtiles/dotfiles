# setup path with no duplicates
export PATH="$HOME/.bin:$PATH"
export PATH="/usr/local/bin:$PATH"
typeset -gU cdpath fpath mailpath path

# enable advanced command autocomplete
autoload -Uz compinit

zstyle ':prezto:load' pmodule \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'completion' \
  'archive' \
  'fasd' \
  'git' \
  'osx' \
  'syntax-highlighting' \
  'history-substring-search' \
  'autosuggestions' \
  'ssh' \
  'prompt'
zstyle ':prezto:module:editor' key-bindings 'vi'
zstyle ':prezto:*:*' case-sensitive 'no'
zstyle ':prezto:*:*' color 'yes'
zstyle ':prezto:module:ssh-agent' forwarding 'yes'

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# setup fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fasd --init auto)"

prompt pure

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

bindkey -v
bindkey '^R' fzf-history-widget
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^b' backward-word
bindkey '^f' forward-word

autoload -U zmv
alias zmv="noglob zmv -W"

# Don't try to glob with zsh so you can do
# stuff like ga *foo* and correctly have
# git add the right stuff
alias git='noglob git'

# custom aliases
alias ll='ls -alGh'
alias ls='ls -Gh'
alias cdp='cd ~/Projects'
alias ccat='bat -pp'
alias nscheck='host -t NS -W 2'

alias random_words='echo ">>>>>>>>>> Adjectives"; shuf -n 5 ~/computer-setup/local/adjectives.txt; echo ">>>>>>>>>> Nouns"; shuf -n 5 ~/computer-setup/local/nouns.txt'
source $HOME/computer-setup/local/cnam.zsh

# advanced ls when in new directory
chpwd() {
  exa --all --group-directories-first --header --long
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

# search old zhistory
zhistory_backup_fzf() {
  cat ~/.zsh_history.backup | fzf
}

eval "$(/opt/homebrew/bin/brew shellenv)"

# setup asdf
# source $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)
source $(brew --prefix asdf)/libexec/asdf.sh
