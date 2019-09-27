"set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'ap/vim-buftabline'
Plugin 'xolox/vim-misc'
Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'sotte/presenting.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'posva/vim-vue'
Plugin 'aserebryakov/vim-todo-lists'
Plugin 'fisadev/vim-isort'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'prettier/vim-prettier'
Plugin 'pearofducks/ansible-vim'
Plugin 'nvie/vim-flake8'
Plugin 'fatih/vim-go'
Plugin 'dense-analysis/ale'
Plugin 'dracula/vim'
Plugin 'evidens/vim-twig'
Plugin 'tomtom/tcomment_vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'ElmCast/elm-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
filetype plugin on

set relativenumber
set number
set laststatus=2
set title
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
set ruler
set binary noeol
set rulerformat=%25(%n%m%r:\ %Y\ [%l,%v]\ %p%%%)
set autoread
set scrolloff=4
set ignorecase
set smartcase
set incsearch
set hlsearch
set showmatch
set nocompatible
set hidden
set nomodeline
set encoding=utf-8
set backspace=indent,eol,start
set cursorline
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.*.swp,*.pyc
set backupcopy=yes
set colorcolumn=89

let mapleader=","
let g:GrepRoot="3"
let g:AutoPairsMapCR=0
let g:ctrlp_map = '<c-o>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let NERDTreeMinimalUI=1
let g:VimTodoListsMoveItems = 0
let g:buftabline_numbers = 0
let g:buftabline_indicators = 1
let g:buftabline_separators = 0
let g:buftabline_show       = 2
let g:indentLine_color_term = 8
let g:NERDSpaceDelims = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0

filetype off
syntax on
syntax enable

set t_Co=256
set background=light
colorscheme PaperColor

highlight ExtraWhitespace ctermbg=9
highlight default RedBG ctermbg=9
highlight cursorline ctermbg=0
highlight colorColumn ctermbg=0
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

match ExtraWhitespace /\s\+$/

vnoremap < <gv
vnoremap > >gv
nnoremap < <<
nnoremap > >>
cnoreabbrev Ack Ack!

autocmd FileType make setlocal noexpandtab

function! HLNext (blinktime)
  let [bufnum, lnum, col, off] = getpos('.')
  let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  let target_pat = '\c\%#'.@/
  let red = matchadd('RedBG', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime / 2 * 1000) . 'm'
  call matchdelete(red)
  redraw
  exec 'sleep ' . float2nr(a:blinktime / 2 * 1000) . 'm'
endfunction

nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>
nmap <C-N> :bnext<CR>
nmap <C-P> :bprevious<CR>
nmap <C-T> :edit<Space>
nmap <C-X> :bd<CR>
nmap <C-w> yiw
nmap <C-s> viw"0p
nmap <C-c> gccj
vmap <C-c> gcj
nnoremap <C-f> :Ack!<Space>
nnoremap <silent> n   n:call HLNext(0.2)<CR>
nnoremap <silent> N   N:call HLNext(0.2)<CR>
map <C-l> :NERDTreeToggle<CR>

" For presenting
augroup presentation
    autocmd!
    au BufEnter _SLIDE_ setlocal noshowmode
    au BufEnter _SLIDE_ setlocal noruler
    au BufEnter _SLIDE_ setlocal laststatus=0
    au BufEnter _SLIDE_ setlocal noshowcmd
    au BufEnter _SLIDE_ setlocal showtabline=0
    au BufEnter _SLIDE_ :IndentLinesDisable
    au BufEnter _SLIDE_ nmap <LEFT> :PresentingPrev<CR>
    au BufEnter _SLIDE_ nmap <RIGHT> :PresentingNext<CR>
augroup END

" status line color
au InsertEnter * hi statusline ctermbg=2 ctermfg=0
au InsertLeave * hi statusline ctermbg=0
hi statusline ctermbg=0