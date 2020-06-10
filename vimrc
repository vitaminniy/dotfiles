"" PLUGINS

if filereadable(expand("~/.vimrc.plugins"))
    source ~/.vimrc.plugins
endif

"" GENERAL

let mapleader=","
set nocompatible

filetype plugin indent on   " autodetect file type
syntax on                   " syntax highlighting
scriptencoding utf-8
set encoding=utf-8
set termencoding=utf-8
set t_ut=
set ttyscroll=10
set ttyfast

if has('termguicolors')
    set termguicolors
endif

set background=dark

set showtabline=2

if has('clipboard')
    if has('unnamedplus')
        set clipboard=unnamed,unnamedplus
    else
        set clipboard=unnamed
    endif
endif


set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set showcmd

set mouse=""
set noswapfile                  " disable swap files
set autochdir                   " auto change current directory to file directory
set hidden                      " Allow buffer switching without saving
set history=1000
set number
set relativenumber
set virtualedit=block

" Shortcuts
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

noremap <leader>hl :nohl<CR>

"""""""""""""""""""""""""""""""""" APPERENCE """""""""""""""""""""""""""""""""""
set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display the current mode

set cursorline                  " Highlight current line

highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same
                                " background color in relative mode
set laststatus=2                " always display statusline
set statusline=%<%n\ %F\ %m\ %r\ %y\ 0x%B,%b%=%l:%c\ %P

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
set linebreak

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

"""""""""""""""""""""""""""""""""" FORMATTING """"""""""""""""""""""""""""""""""

set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current

""""""""""""""""""""""""""""""""" KEY MAPPING """"""""""""""""""""""""""""""""""

nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

nmap j gj
nmap k gk

"""""""""""""""""""""""""""""""""" Fugitive """"""""""""""""""""""""""""""""""""

nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gw :Gw<CR>

""""""""""""""""""""""""""""""""""" vim-go """""""""""""""""""""""""""""""""""""

let g:go_highlight_extra_types = 1
let g:go_highlight_functions = 0
let g:go_highlight_function_parameters = 0
let g:go_highlight_function_calls = 0
let g:go_highlight_types = 0
let g:go_highlight_fields = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1

let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1

let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 1

let g:go_term_enabled = 1
let g:go_term_close_on_exit = 0

function! GoEscape()
    set makeprg=GO111MODULES=on\ go\ build\ -mod=vendor\ -gcflags='-m'\ %:p:h\ 2>&1
    make
    set makeprg=make
    copen
endfunction

command! GoEscape call GoEscape()

"""""""""""""""""""""""""""""""""""" Rust """"""""""""""""""""""""""""""""""""""

let g:rust_clip_command = 'pbcopy'
let g:rustfmt_autosave = 1

""""""""""""""""""""""""""""""""""" vimwiki """"""""""""""""""""""""""""""""""""

let g:vimwiki_list = [
\ {
\	'path': '$HOME/Yandex.Disk.localized/vimwiki',
\	'path_html': '$HOME/Yandex.Disk.localized/vimwiki/wiki_html',
\ }
\ ]
let g:vimwiki_ext = '.md'
let g:vimwiki_syntax = 'markdown'
let g:vimwiki_global_ext = 0

"""""""""""""""""""""""""""""""""" coc-nvim """"""""""""""""""""""""""""""""""""

let g:coc_global_extensions = [
\ 'coc-json',
\ 'coc-yaml',
\ 'coc-python',
\ 'coc-lua',
\ 'coc-cmake',
\ 'coc-markdownlint'
\ ]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)


" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
