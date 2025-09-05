" ==============================================================================
" VIM CONFIGURATION
" ==============================================================================
" NOTE: Neovim is the primary full-feature editor, vim is used as minimal editor

set nocompatible

" ==============================================================================
" GENERAL SETTINGS
" ==============================================================================

" Display
set number                      " Show line numbers
set relativenumber              " Show relative line numbers
set showcmd                     " Show incomplete commands
set showmode                    " Show current mode
set nowrap                      " Don't wrap long lines
set laststatus=2                " Always show status line
set ruler                       " Show cursor position

" Behavior
set backspace=indent,eol,start  " Allow backspace over everything
set history=1000                " Keep command history
set autoread                    " Auto-reload files changed outside vim
set hidden                      " Allow buffers in background
set mouse=a                     " Enable mouse support
set scrolloff=5                 " Keep 5 lines visible above/below cursor
set sidescrolloff=5             " Keep 5 columns visible left/right of cursor

" ==============================================================================
" INDENTATION & TABS
" ==============================================================================

set autoindent                  " Copy indent from current line
set smartindent                 " Smart autoindenting for code
set smarttab                    " Smart tab behavior
set shiftwidth=2                " Spaces for autoindent
set softtabstop=2               " Spaces for tab key
set tabstop=2                   " Display width of tab character
set expandtab                   " Use spaces instead of tabs

" ==============================================================================
" SEARCH SETTINGS
" ==============================================================================

set incsearch                   " Search as you type
set hlsearch                    " Highlight search results
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive if uppercase used

" ==============================================================================
" VISUAL INDICATORS
" ==============================================================================

set list listchars=tab:\ \ ,trail:·  " Show tabs and trailing spaces
set nofoldenable                     " Don't fold by default

" ==============================================================================
" FILE HANDLING
" ==============================================================================

" Swap files
set directory^=$HOME/.vim/tmp   " Store swap files in home directory

" Backup files
set nobackup                    " Don't create backup files
set nowritebackup               " Don't create backup before overwriting

" Performance
set updatetime=750              " Faster update time for better UX

" ==============================================================================
" COMPLETION
" ==============================================================================

set wildmode=list:longest       " Command completion behavior
set wildmenu                    " Enhanced command completion

" ==============================================================================
" VISUAL APPEARANCE
" ==============================================================================

" Colors and syntax
if has("termguicolors")
  set termguicolors
endif

syntax on
colorscheme retrobox
set background=dark

" Adapt to system appearance (macOS)
let output = system("defaults read -g AppleInterfaceStyle")
if v:shell_error != 0
  set background=light
endif

" Sign column
set signcolumn=auto             " Show sign column when needed

" ==============================================================================
" SECURITY
" ==============================================================================

set modelines=0                 " Disable modelines
set nomodeline                  " Don't process modelines
set secure                      " Restrict dangerous commands

" ==============================================================================
" FILE TYPE CONFIGURATIONS
" ==============================================================================

" Markdown
augroup markdown
  autocmd!
  autocmd FileType markdown highlight link markdownError None
  " autocmd FileType markdown setlocal shiftwidth=2 tabstop=2
  " autocmd ColorScheme retrobox hi Normal guibg=NONE ctermbg=NONE
augroup END

" GPG encrypted files
augroup encrypted
  autocmd!
  autocmd BufReadPre,FileReadPre *.gpg set viminfo=
  autocmd BufReadPre,FileReadPre *.gpg set noswapfile noundofile nobackup
  autocmd BufReadPost,FileReadPost *.gpg :%!gpg --decrypt 2> /dev/null
  " autocmd BufWritePre *.gpg :%!gpg -ae --default-recipient-self
  autocmd BufWritePre,FileWritePre *.gpg :%!gpg --symmetric 2> /dev/null
  autocmd BufWritePost,FileWritePost *.gpg u
augroup END

" ==============================================================================
" AUTO COMMANDS
" ==============================================================================

" File explorer settings
let g:netrw_liststyle = 3       " Tree view for netrw

" Auto-reload files when focus gained
autocmd FocusGained,BufEnter * :checktime
