call plug#begin('~/.vim/plugged')
Plug 'ap/vim-buftabline'
Plug 'xolox/vim-misc'
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'bronson/vim-trailing-whitespace'
Plug 'editorconfig/editorconfig-vim'
Plug 'sotte/presenting.vim'
Plug 'junegunn/goyo.vim'
Plug 'posva/vim-vue'
Plug 'aserebryakov/vim-todo-lists'
Plug 'fisadev/vim-isort'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'prettier/vim-prettier'
Plug 'pearofducks/ansible-vim'
Plug 'nvie/vim-flake8'
Plug 'fatih/vim-go'
Plug 'dense-analysis/ale'
Plug 'tomtom/tcomment_vim'
Plug 'ryanoasis/vim-devicons'
Plug 'ElmCast/elm-vim'
Plug 'vim-airline/vim-airline'
Plug 'suan/vim-instant-markdown'
Plug 'vim-scripts/django.vim'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'nikvdp/ejs-syntax'
Plug 'arcticicestudio/nord-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'elixir-editors/vim-elixir'
Plug 'morhetz/gruvbox'
Plug 'stephenway/postcss.vim'
Plug 'mattreduce/vim-mix'
Plug 'gko/vim-coloresque'
call plug#end()

set relativenumber
set number
set title
set ruler
" set binary noeol
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
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 0
let g:ale_linters = {
\   'python': ['flake8', 'black'],
\   'typescript': ['tslint'],
\   'elixir': ['mix'],
\   'c': [],
\}
let g:ale_fixers = {
\   'elixir': ['mix_format', 'remove_trailing_lines', 'trim_whitespace'],
\}
let g:instant_markdown_autostart = 0
let g:instant_markdown_browser = "/usr/bin/surf"
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:vista#renderer#enable_icon = 0
let g:nord_cursor_line_number_background = 1
let g:vim_markdown_folding_disabled = 1
let g:black_linelength = 119
let g:black_skip_string_normalization = 1

filetype plugin on
filetype on
syntax on

set t_Co=256
set background=dark
colorscheme gruvbox
" autocmd vimenter * ++nested colorscheme gruvbox

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
autocmd FileType yaml setlocal foldmethod=indent

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
nmap <C-Tab> :bnext<CR>
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
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" For presenting
augroup presentation
    autocmd!
    au BufEnter _SLIDE_ :IndentLinesDisable
    au BufEnter _SLIDE_ nmap <LEFT> :PresentingPrev<CR>
    au BufEnter _SLIDE_ nmap <RIGHT> :PresentingNext<CR>
    au BufEnter _SLIDE_ setlocal conceallevel=2
    au BufEnter _SLIDE_ setlocal noshowmode
    au BufEnter _SLIDE_ setlocal noruler
    au BufEnter _SLIDE_ setlocal laststatus=0
    au BufEnter _SLIDE_ setlocal noshowcmd
    au BufEnter _SLIDE_ setlocal showtabline=0
    au BufEnter _SLIDE_ setlocal shortmess+=F
augroup END

function! StartPresentation()
    PresentingStart
    Goyo
    hi StatusLine ctermfg=2
endfunction
command Present :call StartPresentation()
