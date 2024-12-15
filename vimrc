set relativenumber
set number
set mouse=a
set autoindent

" This part set 4 spaces for identation, also when pressing tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab  

set cursorline
set nocompatible
set laststatus=2

set laststatus=2
set statusline=%m\ %F\ %y\ %{&fileencoding?&fileencoding:&encoding}\ %=%(C:%c\ L:%l\ %P%)

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
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'preservim/nerdtree'
Plug 'udalov/kotlin-vim'

call plug#end()

let g:mkdp_theme = 'light'
" colorscheme evening
" colorscheme habamax
" colorscheme lunaperche
" colorscheme pablo
colorscheme slate

" brackets closer mappings
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

filetype plugin on

nnoremap <leader>. :NERDTreeFocus<CR>

