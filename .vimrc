"" PLUGINS

if filereadable(expand("~/.vimrc.plugins"))
    source ~/.vimrc.plugins
endif

"" GENERAL

let mapleader=","
set nocompatible

set background=dark

filetype plugin indent on
scriptencoding utf-8
set encoding=utf-8
set showtabline=2
set termencoding=utf-8

if has('clipboard')
    if has('unnamedplus')
        set clipboard=unnamed,unnamedplus
    else
        set clipboard=unnamed
    endif
endif

set virtualedit=onemore

if has('cmdline_info')
    set ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd

endif

set mouse=""
set noswapfile
set autochdir
set hidden
set history=1000

"" FORMATTING

set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set smarttab
set splitright
set splitbelow

set et
set wrap
set ai
set cin
set showmatch
set hlsearch
set incsearch
set ignorecase
set lz
set listchars=tab:··
set list
set number
syntax on

set exrc
set secure

set colorcolumn=90
highlight ColorColumn ctermbg=darkgray
