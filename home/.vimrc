
" Plugins {{{
let data_dir = has("nvim") ? stdpath("data") . "/site" : "~/.vim"
if empty(glob(data_dir . "/autoload/plug.vim"))
  silent execute "!curl -fLo ".data_dir."/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin("~/.vim/plugged")
Plug 'tpope/vim-commentary'
call plug#end()
" }}}

" Common {{{
set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
set noexpandtab tabstop=4 shiftwidth=4
set nobackup
set scrolloff=10
set incsearch hlsearch
set ignorecase smartcase
set showmatch
set foldmethod=marker
nnoremap <SPACE> <Nop>
let mapleader = " "
" }}}

" Functions {{{
function! SynGroup()
	let l:s = synID(line('.'), col('.'), 1)
	echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
" }}}

" Colors {{{
highlight Comment ctermfg=8
highlight Visual ctermbg=237
highlight ExtraWhitespace ctermbg=1
match ExtraWhitespace /\s\+$/
" }}}

" Key mappings {{{
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>
vnoremap < <gv
vnoremap > >gv
nnoremap < <<
nnoremap > >>
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>
" }}}

