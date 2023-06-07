"""""""""""""""""""""""""""""" vim-plug automatic install
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'NLKNguyen/papercolor-theme'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'numToStr/Comment.nvim'
Plug 'gpanders/editorconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'hrsh7th/cmp-vsnip'
call plug#end()

"""""""""""""""""""""""""""""" general settings
set mouse=""
set relativenumber
set number
set title
set autoread
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
set cursorline cursorcolumn
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.*.swp,*.pyc
set nobackup
set nowritebackup
set tabstop=2
set softtabstop=-1
set expandtab
set shiftwidth=0
set smarttab
set linebreak
set updatetime=300
set shortmess+=c
set signcolumn=number
set fillchars=vert:\│
filetype indent off
filetype on
syntax on
let g:markdown_folding = 1

"""""""""""""""""""""""""""""" Key mapping
nnoremap <SPACE> <Nop>
let mapleader=" "
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>
vnoremap < <gv
vnoremap > >gv
nnoremap < <<
nnoremap > >>
nmap <silent> gn :bnext<CR>
nmap <silent> gp :bprev<CR>
nmap <silent> <Leader>bo :Buffers<CR>
nmap <silent> <Leader>bd :bp\|bd #<CR>
nmap <silent> <Leader>ww :wincmd w<CR>

"""""""""""""""""""""""""""""" vim-plug settings
let g:plug_threads = 16
let g:plug_timeout = 60
let g:plug_retries = 2
let g:plug_shallow = 1
let g:plug_window = 'vertical topleft new'
let g:plug_pwindow = 'above 12new'
let g:plug_url_format = 'https://git::@github.com/%s.git'

"""""""""""""""""""""""""""""" colorscheme settings
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set background=light
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.light': {
  \       'override' : {
  \         'cursorlinenr_bg' : ['#d8d8d8', '232'],
  \         'cursorline' : ['#d8d8d8', '232'],
  \         'cursorcolumn' : ['#d8d8d8', '232'],
  \         'linenumber_bg' : ['#e4e4e4', '232'],
  \         'color00' : ['#e4e4e4', '232'],
  \         'vertsplit_bg' : ['#e4e4e4', '232'],
  \         'color03' : ['#335E15', '232'],
  \         'statusline_active_bg': ['#1458EC', '232'],
  \       }
  \     }
  \   }
  \ }
augroup papercolor_overrides
    autocmd!
    autocmd ColorScheme PaperColor hi elixirBlockDefinition guifg=#666666
    autocmd ColorScheme PaperColor hi Comment cterm=italic gui=italic
    autocmd ColorScheme PaperColor hi VertSplit guibg=#e4e4e4 guifg=#1458ec
augroup END
colorscheme PaperColor
highlight ExtraWhitespace guibg=#ff0000
match ExtraWhitespace /\s\+$/

"""""""""""""""""""""""""""""" NerdTree settings
nnoremap <Leader>l :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIgnore=['node_modules', '\.git$', '\.vim$', '\.ropeproject']
let g:NERDTreeShowHidden = 1
let g:NERDTreeStatusline = ''
let g:NERDTreeMinimalUI = 1
let g:NERDTreeMinimalMenu=1

"""""""""""""""""""""""""""""" fzf settings
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_preview_window = ['down:40%', 'ctrl-/']
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_tags_command = 'ctags -R'
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
let g:fzf_colors = {
\ 'fg':      ['fg', 'Normal'],
\ 'bg':      ['bg', 'Normal'],
\ 'hl':      ['fg', 'Comment'],
\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
\ 'hl+':     ['fg', 'Statement'],
\ 'info':    ['fg', 'PreProc'],
\ 'border':  ['fg', 'Ignore'],
\ 'prompt':  ['fg', 'Conditional'],
\ 'pointer': ['fg', 'Exception'],
\ 'marker':  ['fg', 'Keyword'],
\ 'spinner': ['fg', 'Label'],
\ 'header':  ['fg', 'Comment'] }
nmap <Leader>f :FZF<CR>
nmap <Leader>/ :Ag!<CR>


lua require('conf')
