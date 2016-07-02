"Run :UpdateRemotePlugins for new plugins to have effect

"install xclip for clipboard support
"No need to "+ for copy pasting
set clipboard+=unnamedplus

"Terminal normal mode with Esc:
:tnoremap <Esc> <C-\><C-n>

"Set tab to 4 spaces:
set shiftwidth=4
set expandtab

"Enable syntax highlighting:
syntax enable

"Line Numbers
set number
"show relative line number
set relativenumber
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc

nnoremap <F2> :call NumberToggle()<cr>

"highlight matching bracket when a new one is inserted
set showmatch

"detect specific actions for specific filetypes
filetype on
filetype indent on
filetype plugin on

"set status line
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

"turn on syntax highlighting
syntax on

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

set hlsearch            " Highlight search results.
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set incsearch           " Incremental search.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

"Use C-L ro clear search highlight
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/deoplete.nvim'
Plug 'hdima/python-syntax'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'zchee/deoplete-clang'
" Add plugins to &runtimepath
call plug#end()

"Airline themes
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'

"Highlight all python syntaxes
let python_highlight_all = 1

"Disable .pyc files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

"Indent Line Plugin
let g:indentLine_color_term = 172
let g:indentLine_char = '|'

"deoplete-clang config:
"g:deoplete#sources#clang#libclang_path
"g:deoplete#sources#clang#clang_header
"g:deoplete#sources#clang#std
"g:deoplete#sources#clang#flags
"g:deoplete#sources#clang#sort_algo
"g:deoplete#sources#clang#clang_complete_database
set encoding=utf-8
