
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

" Colors {{{
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
" }}}

