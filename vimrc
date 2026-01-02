"set relativenumber
"set number
set autoindent

" This part set 4 spaces for identation, also when pressing tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab  

set cursorline
set nocompatible
set laststatus=2

" For status line
set laststatus=2
set statusline=%m\ %f\ %y\ %{&fileencoding?&fileencoding:&encoding}\ %=%(C:%c\ L:%l\ %P%)

" set clipboard=unnamedplus

set cryptmethod=blowfish2
set nobackup
set nowritebackup
set viminfo=

filetype on
filetype plugin on
filetype indent on
filetype plugin indent on
syntax enable


let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

 " SET LIGHT THEME ON MARKDOWN PREV
let g:mkdp_theme = 'light'

" COLORSCHEME
colorscheme slate

" commands for SHELL OUTPUT TO TMP PAGE
" redirect shell output to tmp file using read
command! -nargs=1 W execute 'split tabnew' | execute 'read !'.printf('%s', <q-args>)
" This version also save the tmp file into /tmp/ folder
" command! -nargs=1 Vish execute 'enew' | execute 'read !'.printf('%s', <q-args>) | execute 'w /tmp/tempfile_'.strftime('%Y%m%d%H%M%S').'.txt'
