"set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
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
Plugin 'tomtom/tcomment_vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'ElmCast/elm-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'suan/vim-instant-markdown'
Plugin '2pxsolidblack/docsurf.vim'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'liuchengxu/vista.vim'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'vim-scripts/django.vim'
Plugin 'joukevandermaas/vim-ember-hbs'
Plugin 'arcticicestudio/nord-vim'

call vundle#end()
filetype plugin on

set relativenumber
set number
set title
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
" set colorcolumn=80
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

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
let g:ale_lint_on_save = 1
let g:ale_linters = {
\   'python': ['flake8', 'mypy'],
\   'typescript': ['tslint'],
\}
let g:instant_markdown_autostart = 0
let g:instant_markdown_browser = "/usr/bin/surf"
let g:airline_theme='nord'
let g:vista#renderer#enable_icon = 0
let g:nord_cursor_line_number_background = 1

filetype on
syntax on
syntax enable

set t_Co=256
set background=dark
colorscheme CarloRatm

highlight CursorLineNR cterm=NONE
highlight default RedBG ctermbg=9
highlight ExtraWhitespace ctermbg=1

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
nmap <C-d> :DocSurf<CR>
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

function! StartPresentation()
    PresentingStart
    Goyo
    hi StatusLine ctermfg=1
endfunction
command Present :call StartPresentation()