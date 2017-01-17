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

set norelativenumber

nnoremap <F2> :call NumberToggle()<cr>
"
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
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'hdima/python-syntax'
Plug 'tpope/vim-fugitive'
"Plug 'Yggdroot/indentLine'
Plug 'zchee/deoplete-clang'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/neoinclude.vim'
" Make sure npm is installed
Plug 'carlitux/deoplete-ternjs', { 'do': 'sudo npm install -g tern' }
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
"let g:indentLine_color_term = 172
"let g:indentLine_char = '|'


"Map F3 to toggle NERDTree
nmap <F3> <plug>NERDTreeTabsToggle<cr>

" Use deoplete.
let g:deoplete#enable_at_startup = 1

"deoplete-clang config:
"use [sudo] find / -name libclang.so to find this:
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

set encoding=utf-8


"Move window between tabs:
function MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    vsp
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

function MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    vsp
  else
    close!
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

map <C-w>n :call MoveToNextTab()<CR><C-w>H
map <C-w>m :call MoveToPrevTab()<CR><C-w>H

function MakeFile_setting()
    setlocal shiftwidth=8
    setlocal noexpandtab
endfunc
