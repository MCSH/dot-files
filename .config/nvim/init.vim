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

" Use mouse
set mouse=a

" More natural splits
set splitbelow
set splitright

" Search stuff
set hlsearch            " Highlight search results.
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set incsearch           " Incremental search.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

" Use C-L to clear search highlights
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

" vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-airline/vim-airline'
call plug#end()

"Map F3 to toggle NERDTree
nmap <F3> <plug>NERDTreeTabsToggle<cr>

"Disable .pyc files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

function MakeFile_setting()
    setlocal shiftwidth=8
    setlocal noexpandtab
endfunc

"Airline themes
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'
