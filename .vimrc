"" PLUGINS

if filereadable(expand("~/.vimrc.plugins"))
    source ~/.vimrc.plugins
endif

"" GENERAL

let mapleader=","
set nocompatible
set backspace=indent,eol,start

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
set nowrap
set ai
set cin
set showmatch
set hlsearch
set incsearch
set ignorecase
set lz
set listchars=tab:··
set list
set relativenumber
syntax on

set exrc
set secure

set colorcolumn=90
highlight clear LineNr
highlight ColorColumn ctermbg=darkgray


"" STATUSLINE
set laststatus=2

set statusline= 
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=\ %f
set statusline+=%m\ 
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 


"" FUNCTIONS
function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

"" vim-go
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
"" ------------------------------------------------------------

