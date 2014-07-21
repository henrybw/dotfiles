" Pathogen must be initialized immediately in order to work properly
filetype off
execute pathogen#infect()
execute pathogen#helptags()

" Pathogen only re-enables filetype detection; it won't re-enable plugin/indent
filetype plugin indent on

" Enable cscope support
source $HOME/.vim/bundle/cscope/cscope_maps.vim

"
" Theming
"

colorscheme desert
syntax on
set number
set cmdheight=1

" I want splits to open up the way I read: left-to-right, top-to-bottom
set splitright
set splitbelow

set nohlsearch  " No search pattern highlighting by default

" Enable airline
set laststatus=2
let g:airline_theme = 'powerlineish'

" I've gotten this to work on my Linux installation (with the modified fonts),
" but it never works on any other system unless I install the modified fonts,
" so I decided the 'cool' symbols weren't worth it.
let g:airline_powerline_fonts = 0

" Some special magic to get full 256 colors working in terminals
set t_ut=
if (&term == "xterm" || &term == "xterm-256color")
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
endif

"
" Keys/Controls
"

" Shortcuts for cycling buffers
nnoremap <leader>[ :bp<CR>
nnoremap <leader>] :bn<CR>

" Allows Ctrl-C to be always used in place of Esc (normally, Visual Mode
" doesn't allow you to exit with Ctrl-C, for example).
inoremap <C-c> <Esc>

" For the CtrlP plugin
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

" Open tag in a vertical split (Ctrl-W ] opens in horizontal split)
map <C-w>\ :vsp<CR>:exec("tag ".expand("<cword>"))<CR>

" Vertical split version of Ctrl-W F (because I never use vim tabs anyway)
map <C-w>gf :vertical wincmd f<CR>

" Map Y do be analog of D
map Y y$

" Versions of cc and o that don't exit normal mode
nmap <leader>cc cc<ESC>
nmap <leader>o o<ESC>
nmap <leader>O O<ESC>

" Toggle autocomment mode (normally I don't like it, but it's really helpful
" when writing multiline C block comments, for example)
imap <C-s> <ESC>:set formatoptions+=ro<CR>a
imap <C-d> <ESC>:set formatoptions-=ro<CR>a
nmap <leader>s <ESC>:set formatoptions+=ro formatoptions?<CR>
nmap <leader>d <ESC>:set formatoptions-=ro formatoptions?<CR>

" Toggle paste mode
map zp :set invpaste paste?<CR>

" Toggle search pattern hilighting and display the value
map <leader>n :set hlsearch! hlsearch?<CR>

" Emulate some IDE-style editing behavior with backspace and shift-tab
set backspace=indent,eol,start
imap <S-Tab> <Esc><<i
imap <C-BS> <C-w>

" Fix PgUp/PgDn
map <silent> <PageUp> 1000<C-U>
map <silent> <PageDown> 1000<C-D>
imap <silent> <PageUp> <C-O>1000<C-U>
imap <silent> <PageDown> <C-O>1000<C-D>

" Enable mouse
set mouse=a

" Often I hold shift too long when issuing these commands
" (adapted from http://www2.mathematik.hu-berlin.de/~altmeyrx/BZQ/vimrc)
command! Q q
command! Qall qall
command! W w
command! Wall wall
command! WQ wq
command! E e
command! Bd bd

" Never use Ex mode -- I never *mean* to press it
nnoremap Q <ESC>

"
" Formatting
"

" The C file plugin resets whatever formatoptions we specify here, so we need
" to set this to trigger on buffer load events instead.
autocmd BufNewFile,BufRead * setlocal formatoptions=cqlj

set textwidth=80

" Tab settings
set shiftwidth=4
set tabstop=4
"set shiftwidth=2
"set tabstop=2
set expandtab
set smarttab  " Use shiftwidth for tabs instead of tab stops

" Indentation
set noautoindent
set nosmartindent
set cindent

" Indents lines inside parens to the column where the starting paren is
set cinoptions=(0,w1,W4

" Indent statements in cases relative to the case labels (this is confusing;
" see the vim documentation for the lN setting for an example).
set cinoptions+=l1

set cinoptions+=jN,JN  " Fixes for Java/JavaScript indentation

" Settings for coding styles that prefer certain constructs be unindented
set cinoptions+=N-s  " Don't indent namespace blocks
set cinoptions+=g0  " Don't indent C++ class scope declarations
"set cinoptions+=g1  " Google-style 1 space indent for C++ class scope
set cinoptions+=:0  " Don't indent case labels
set cinoptions+=t0  " Don't indent function return type declaration
set cinoptions+=i4  " Always indent C++ initializers/base classes by 4 spaces

" Normally we don't want line wrapping, so disable it for everything but plain
" text and files with no file type (which are probably also plain text).
set wrap
autocmd FileType * if !empty(&filetype) && &filetype != "text" | set nowrap

set linebreak
set nostartofline
set display+=lastline

"
" Paste settings
"

" Use + register whenever possible
if has('unnamedplus')
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif

"
" GVim settings
"

if has("gui_running")
    " Fonts tend to look smaller than they do in console vim
    set guifont=Consolas\ 11
    set linespace=2

    set mousehide  " Hide the mouse pointer while typing

    " No scrollbars or toolbars
    set guioptions-=T
    set guioptions-=m
    set guioptions-=r
    set guioptions-=L
endif

"
" Miscellaneous settings
"

set nocompatible
set history=100

" Don't keep around the backup file on success
set writebackup
set nobackup

" Enable 'wild menus' for tags
set wildmenu
set showfulltag

" Ignore case in searches for all-lowercase searches, but respect case if
" there is an uppercase character.
set ignorecase
set smartcase

" Settings for modified buffers
set hidden  " Keep around modified buffers without having to save them
set confirm  " Ask instead of autofailing when doing a destructive action

set visualbell  " No sounds please
set printoptions=syntax:y,wrap:y

