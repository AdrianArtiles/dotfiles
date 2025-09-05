" NOTE: neovim is the primary full-feature editor, and vim is used as an alternative minimal editor

set nocompatible

" ================ General Config ====================
set number                      "Line numbers are good
set relativenumber              "Relative line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set autoread                    "Reload files changed outside vim
set nowrap                      "Don't wrap lines
" set linebreak                   "Wrap lines at convenient points

" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

augroup markdown
  autocmd!
  autocmd FileType markdown highlight link markdownError None
  " autocmd FileType markdown setlocal shiftwidth=2 tabstop=2
  " autocmd ColorScheme retrobox hi Normal guibg=NONE ctermbg=NONE
augroup END

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

set mouse=a

set nofoldenable        "dont fold by default

" ================ Completion =======================
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches

" filetype plugin on
" filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" set swap file directory relative to home, instead of working directory
" be sure the directory exists
set directory^=$HOME/.vim/tmp//

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
" set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=750

" don't give |ins-completion-menu| messages.
" set shortmess+=c

" always show signcolumns
" set signcolumn=yes
set signcolumn=auto

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Security ==========================
set modelines=0
set nomodeline
set secure


set scrolloff=5
set sidescrolloff=5
set laststatus=2
set ruler
let g:netrw_liststyle = 3


autocmd FocusGained,BufEnter * :checktime




if (has("termguicolors"))
  set termguicolors
endif

syntax on
colorscheme retrobox
set background=dark
let output = system("defaults read -g AppleInterfaceStyle")
if v:shell_error != 0
  set background=light
endif

augroup encrypted
  autocmd!
  autocmd BufReadPre,FileReadPre *.gpg set viminfo=
  autocmd BufReadPre,FileReadPre *.gpg set noswapfile noundofile nobackup
  autocmd BufReadPost,FileReadPost *.gpg :%!gpg --decrypt 2> /dev/null
  " autocmd BufWritePre *.gpg :%!gpg -ae --default-recipient-self
  autocmd BufWritePre,FileWritePre *.gpg :%!gpg --symmetric 2> /dev/null
  autocmd BufWritePost,FileWritePost *.gpg u
augroup END
