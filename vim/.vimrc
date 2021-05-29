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
Plug 'tomtom/tcomment_vim'
Plug 'ryanoasis/vim-devicons'
Plug 'ElmCast/elm-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'suan/vim-instant-markdown'
Plug 'vim-scripts/django.vim'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'nikvdp/ejs-syntax'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-markdown'
Plug 'elixir-editors/vim-elixir'
Plug 'stephenway/postcss.vim'
Plug 'mattreduce/vim-mix'
Plug 'gko/vim-coloresque'
Plug 'merlinrebrovic/focus.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'joshdick/onedark.vim'
call plug#end()

set relativenumber
set number
set title
set ruler
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
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
set linebreak
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let mapleader=","
let g:GrepRoot="3"
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
let g:indentLine_char = '⎸'
let g:NERDSpaceDelims = 1
let g:instant_markdown_autostart = 0
let g:instant_markdown_browser = "/usr/bin/surf"
let g:airline_theme='nord'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:vista#renderer#enable_icon = 0
let g:nord_cursor_line_number_background = 1
let g:vim_markdown_folding_disabled = 1

filetype plugin on
filetype plugin indent on
filetype on
syntax on

set t_Co=256
set background=dark
let g:one_allow_italics = 1
colorscheme nord

highlight CursorLineNR ctermbg=9 cterm=NONE
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
autocmd VimEnter * execute "IndentLinesEnable"
autocmd BufWritePre * LspDocumentFormat

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
nmap <C-Tab> :bnext<CR>
nmap <C-P> :bprevious<CR>
nmap <C-T> :edit<Space>
nmap <C-X> :bd<CR>
nnoremap <C-f> :Ack!<Space>
nnoremap <silent> n   n:call HLNext(0.2)<CR>
nnoremap <silent> N   N:call HLNext(0.2)<CR>
nnoremap <space> :nohlsearch<CR>
map <C-l> :NERDTreeToggle<CR>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:focus_use_default_mapping = 0
nmap <C-a> <Plug>FocusModeToggle
nmap <silent> <C-c> :TComment<CR>
vmap <silent> <C-c> :TCommentBlock<CR>
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

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
