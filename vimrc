"" PLUGINS

if filereadable(expand("~/.vimrc.plugins"))
    source ~/.vimrc.plugins
endif

"" GENERAL

syntax on                   " syntax highlighting
filetype plugin indent on   " autodetect file type

set t_ut=
set ttyscroll=10
set ttyfast
let mapleader=","
set nocompatible
set background=dark

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


if has('cmdline_info')
    set ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd
endif

set mouse=""
set noexpandtab
set smarttab
set et
set nowrap
set ai
set cin
set lz
set exrc
set secure


set laststatus=2                " always display statusline

set statusline= 
set statusline+=%#PmenuSel#
set statusline+=\ %f
set statusline+=%m\ 
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

set noswapfile                  " disable swap files
set autochdir                   " auto change current directory to file directory
set hidden                      " Allow buffer switching without saving
set history=1000
set number
set relativenumber
set virtualedit=block
set showmode                    " Display the current mode
set cursorline                  " Highlight current line
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then
                                " longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set colorcolumn=81              " higlight column 81
set list!
set listchars=tab:·\ ,trail:.   " Highlight problematic whitespace
set fillchars+=vert:\ 
set vb t_vb=                    " No more beeps
set lazyredraw
set nofoldenable

set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current


nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

nmap j gj
nmap k gk

"" vim-go
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 1
let g:go_term_enabled = 1
let g:go_term_close_on_exit = 0

"" FUNCTIONS
function! GoEscape()
    set makeprg=GO111MODULES=on\ go\ build\ -mod=vendor\ -gcflags='-m'\ %:p:h\ 2>&1
    make
    set makeprg=make
    copen
endfunction

"" COMMANDS
command! GoEscape call GoEscape()
