set relativenumber
set number
set tabstop=4
set smarttab
set mouse=a
set softtabstop=4
set autoindent
set shiftwidth=4

set cursorline
set nocompatible
set laststatus=2

set clipboard=unnamedplus

if (has("termguicolors"))
 set termguicolors
endif

" Maps keys for selection commentary
noremap <leader>7 :Commentary<cr>
noremap <leader>9 :Goyo<cr>
vnoremap <C-c> "*y

syntax enable

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()

Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'
" Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'itchyny/lightline.vim'
" Plug 'erietz/vim-terminator', { 'branch': 'main'}
Plug 'tomasiser/vim-code-dark'
Plug 'preservim/nerdtree'
Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'

call plug#end()

let g:mkdp_theme = 'light'
colorscheme codedark

" brackets closer mappings
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O

filetype plugin on

nnoremap <leader>. :NERDTreeFocus<CR>

