
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

bindkey -v
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^b' backward-word
bindkey '^f' forward-word

alias cda='cd ~/Areas'
alias cdd='cd ~/Desktop'
alias ccat='bat -pp'
alias nscheck='host -t NS -W 2'
alias random_words='shuf -n 10 ~/computer/local/words.txt'
alias '??'='gh copilot suggest -t shell'
alias 'git?'='gh copilot suggest -t git'
alias 'explain'='gh copilot explain'
source $HOME/computer/local/misc.zsh

mkdir -p ~/computer/local
if [ ! -f ~/computer/local/words.txt ]; then
  curl -s https://raw.githubusercontent.com/bitcoin/bips/master/bip-0039/english.txt -o ~/computer/local/words.txt
fi

# advanced ls when in new directory
chpwd() {
  exa --all --group-directories-first --header --long
}

# custom adig command
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
