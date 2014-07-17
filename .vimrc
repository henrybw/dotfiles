" Pathogen must be initialized immediately in order to work properly
filetype off
execute pathogen#infect()
execute pathogen#helptags()

" Pathogen only re-enables filetype detection; it won't re-enable plugin/indent
filetype plugin indent on

"
" Theming
"

colorscheme desert
syntax on
set number
set cmdheight=1

set nohlsearch  " Switch off search pattern highlighting

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
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>

" Allows Ctrl-C to be always used in place of Esc (normally, Visual Mode
" doesn't allow you to exit with Ctrl-C, for example).
inoremap <C-c> <Esc>

" Map Y do be analog of D
map Y y$

" Toggle paste mode
map zp :set paste! paste?<CR>

"Toggle search pattern hilighting and display the value
if v:version >= 600
  map <f7> :nohlsearch<CR>
else
  map <f7> :set hlsearch! hlsearch?<CR>
endif
imap <f7> <C-O><f7> 

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

" Map Ctrl-Enter to force insert a newine without a comment leader. This works
" even if formatoptions has the 'o' option set, since it just clears the line
" immediately after creating it.
inoremap <C-CR> <ESC>o<ESC>cc

" Normal-mode equivalents of the above. Logically, it should be Ctrl-O and
" Ctrl-Shift-O, but Ctrl-O was already taken.
nnoremap <C-CR> o<ESC>cc
nnoremap <C-S-CR> O<ESC>cc

"
" Formatting
"

" Tab settings: always use 4 spaces for tabs
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab  " Use shiftwidth for tabs instead of tab stops

" Indentation
set noautoindent
set nosmartindent
set cindent

" Indents lines inside parens to the column where the starting paren is
set cinoptions+=(0,W4

" Indent statements in cases relative to the case labels (this is confusing;
" see the vim documentation for the lN setting for an example).
set cinoptions+=l1

set cinoptions+=jN,JN  " Fixes for Java/JavaScript indentation

" Settings for coding styles that prefer certain constructs be unindented
set cinoptions+=N-s  " Don't indent namespace blocks
set cinoptions+=g0  " Don't indent C++ class scope declarations
set cinoptions+=:0  " Don't indent case labels

" TODO: python autoindent is broken

" Normally we don't want line wrapping, so disable it for everything but plain
" text and files with no file type (which are probably also plain text).
set wrap
autocmd FileType * if !empty(&filetype) && &filetype != "text" | set nowrap

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
" Tag settings
"

" Enable 'wild menus'
set wildmenu
set showfulltag

"
" Miscellaneous settings
"

set nocompatible
set history=100

" Don't keep around the backup file on success
set writebackup
set nobackup

set linebreak
set nostartofline
set display+=lastline

" Ignore case in searches for all-lowercase searches, but respect case if
" there is an uppercase character.
set ignorecase
set smartcase

" Settings for modified buffers
set hidden  " Keep around modified buffers without having to save them
set confirm  " Ask instead of autofailing when doing a destructive action

set visualbell  " No sounds please
set printoptions=syntax:y,wrap:y

