
" Plugins {{{
let data_dir = has("nvim") ? stdpath("data") . "/site" : "~/.vim"
if empty(glob(data_dir . "/autoload/plug.vim"))
  silent execute "!curl -fLo ".data_dir."/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin("~/.vim/plugged")
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
call plug#end()
" }}}

" Vim settings {{{
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
set fillchars+=vert:\│
nnoremap <SPACE> <Nop>
let mapleader = " "
" }}}

" Colors {{{
highlight Comment ctermfg=8
highlight Visual ctermbg=237
highlight VertSplit ctermfg=4 ctermbg=16 cterm=NONE
highlight StatusLine ctermfg=15 ctermbg=4 cterm=NONE
highlight StatusLineNC ctermfg=8 ctermbg=234
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
nnoremap gn :bnext<CR>
nnoremap gp :bprev<CR>
nnoremap <Leader>bd :bdelete<CR>
nnoremap <Leader>ww :wincmd w<CR>
nnoremap <Leader>ff :GFiles<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fg :Rg<CR>
nnoremap <Leader>cc :Goyo 60%x100%<CR>
" }}}

