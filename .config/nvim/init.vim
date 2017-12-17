"install xclip for clipboard support
"No need to "+ for copy pasting
set clipboard+=unnamedplus

"Leader 
" I feel strange about this, maybe I might switch to \ someday
let mapleader=","

"Terminal normal mode with Esc:
:tnoremap <Esc> <C-\><C-n>

"Set tab to 4 spaces:
set shiftwidth=4
set expandtab

"Enable syntax highlighting:
syntax enable

" Set colorscheme
colorscheme default

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
Plug 'chrisbra/unicode.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'Sudo npm install -g tern' }
Plug 'ternjs/tern_for_vim'
Plug 'alerque/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'tpope/vim-abolish'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'wesQ3/vim-windowswap'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sjl/gundo.vim'
Plug 'severin-lemaignan/vim-minimap'
Plug 'lervag/vimtex' , { 'for': 'tex' } " Maybe disable infavor of vim-polygt? TODO
Plug 'junegunn/vim-easy-align'
Plug 'derekwyatt/vim-scala'
Plug 'ensime/ensime-vim', {'do': 'sudo pip2 install websocket-client sexpdata'} " TODO config???
Plug 'vim-syntastic/syntastic'
Plug 'xolox/vim-misc' " Req of vim-easytags
Plug 'xolox/vim-easytags'
" TODO Plug 'terryma/vim-multiple-cursors' Doesn't work w/ my other plugins
" TODO https://github.com/justinmk/vim-sneak
Plug 'jiangmiao/auto-pairs'
call plug#end()

"" NERDTREE 
"Map F3 to toggle NERDTree
nmap <F3> <plug>NERDTreeTabsToggle<cr>

"Disable .pyc files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

"Airline themes
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'

" Unicode
" TODO

"Deoplete
let g:deoplete#enable_at_startup = 1

"tern_for_vim
let g:tern#command = ['/usr/bin/tern']
let g:tern#arguments = ["--persistent"]

" Vim Surround
" TODO

" vim-fugitive and vimfugitiveBlam
" TODO

"Vim Abolish
" TODO

"Git Gutter, shows diff w/ HEAD
"Enable GitGutter Shortcut
nmap <Leader>d :GitGutterToggle<CR>

"Netd Commenter
" Use Leader cc to coment, Leader c<space> to toggle comment and <leader>cu to
" uncomment
"
" Config
"
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" vim-windowswap 
" Use Leader ww to yank window, Leader ww to swap it

" sheerun/vim-polyglot
" Awesome list of lots of language! see the page for more details
" TODO config langs I use most

" Goyo
" Distraction free writing

" LimeLight
" Default colors
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = 'DarkGray'
" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 0
" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

nmap <Leader>l  :Limelight!!<cr>

" Vim indent guide
" :IndentGuidesToggle
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg     = 240
hi IndentGuidesEven ctermbg     = darkgrey
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size  = 1

let g:indent_guides_enable_on_vim_startup = 1

" Gundo
nnoremap <Leader>u :GundoToggle<CR>

" Force preview on the bottom
let g:gundo_preview_bottom=1
" Show help, for now
let g:gundo_help=1
" Close on revert
let g:gundo_close_on_revert=1
" Render diff automatically
let g:gundo_auto_preview=1

" Minimap
let g:minimap_show='<leader>ms'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>mc'
let g:minimap_toggle='<leader>mm'

" Type :hi to see what is available
let g:minimap_highlight='IncSearch'

" vim-tex

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" vim-scala

" Ensime-vim
" Typecheck after save
autocmd BufWritePost *.scala silent :EnTypeCheck
" Type inspection
nnoremap <leader>t :EnType<CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Vim-easytags

" Other config
function MakeFile_setting()
    setlocal shiftwidth=8
    setlocal noexpandtab
endfunc

" Open file under cursor in a vsplit
" Usage: Select, ga= will align around =
nnoremap gf <C-W>vgf

function! MyOnBattery()
  return readfile('/sys/class/power_supply/AC/online') == ['0']
endfunction

" Buffer switching
nnoremap <leader>b :buffers<CR>:buffer<Space>

" Set js tab to 2 space.
autocmd FileType javascript setlocal shiftwidth=2 expandtab
autocmd FileType css setlocal shiftwidth=2 expandtab
