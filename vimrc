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

filetype on
filetype plugin on
filetype indent on
filetype plugin indent on

" Maps keys for selection commentary
noremap <leader>7 :Commentary<cr>
" Map for setting highlight
noremap <leader>h :set hls<cr>
" Open the command buffer where I can use vi keys
noremap <leader>1 q:

" Toggle mouse on and off
noremap <leader>m :set mouse=a<cr>

noremap <leader>p :syntax sync minlines=20<cr>
noremap <leader>l :syntax sync fromstart<cr>


syntax enable

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()

Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'preservim/nerdtree'
Plug 'kaarmu/typst.vim'

call plug#end()

" Default mapping for MULTIPLE CURSORS
" let g:multi_cursor_start_word_key      = '<C-n>'  " ctrl+n
" let g:multi_cursor_select_all_word_key = '<C-N>'  " ctrl+
" let g:multi_cursor_start_key           = 'g<C-n>' " ctrl+
" let g:multi_cursor_select_all_key      = 'g<A-n>' " ctrl+
" let g:multi_cursor_next_key            = '<C-n>'  " ctrl+
" let g:multi_cursor_prev_key            = '<C-p>'  " ctrl+
" let g:multi_cursor_skip_key            = '<C-x>'  " ctrl+
" let g:multi_cursor_quit_key            = '<Esc>'  " ctrl+

 " SET LIGHT THEME ON MARKDOWN PREV
let g:mkdp_theme = 'light'


" For typst watch
let g:typst_pdf_viewer = 'floorp'

 " COLORSCHEME
colorscheme slate
" colorscheme habamax
" colorscheme desert
" colorscheme default


" Define a function to set the mappings
" function! SetClosing()
"     inoremap " \\<left>
"     inoremap ' ''<left>
"     inoremap ( ()<left>
"     inoremap [ []<left>
"     inoremap { {}<left>
"     inoremap {<CR> {<CR>}<ESC>O
"     inoremap {;<CR> {<CR>};<ESC>O
" endfunction

" commands for SHELL OUTPUT TO TMP PAGE
" redirect shell output to tmp file using read
command! -nargs=1 W execute 'split tabnew' | execute 'read !'.printf('%s', <q-args>)
" This version also save the tmp file into /tmp/ folder
" command! -nargs=1 Vish execute 'enew' | execute 'read !'.printf('%s', <q-args>) | execute 'w /tmp/tempfile_'.strftime('%Y%m%d%H%M%S').'.txt'

" Set symlink: ln -s -f ~/dotfiles/.vimrc ~/.vimrc
