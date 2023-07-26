" .vimrc

" OPTIONS
" Not compatible with Vi
set nocompatible

"" Numbering
set number relativenumber
set scrolloff=10

"" Status Line
set laststatus=2
""" Default status line plus %L (file line number)
set statusline=%f\ %h%w%m%r%=%-14.(%l,%c%V%)\ %P\ %L

"" Text Width
set textwidth=78
set wrap

"" Highlighting
set hlsearch incsearch

"" True Color Support
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
    let &t_8f = "\<esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<esc>[48;2;%lu;%lu;%lum"
endif

syntax on
set termguicolors
colorscheme slate
"" No background (transparency)
hi Normal guibg=NONE ctermbg=NONE

"" Indenting
filetype indent on
set expandtab smarttab
set shiftwidth=4
set tabstop=4 softtabstop=0

"" Clipboard
set clipboard+=unnamedplus

" REMAPS
"" Leader
let mapleader = " "

"" Explorer
nmap <leader>pv :Ex<cr>
