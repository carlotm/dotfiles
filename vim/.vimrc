call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sgur/vim-editorconfig'
Plug 'preservim/nerdtree'
Plug 'fisadev/vim-isort'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"""""""""""""""""""""""""""""" general settings
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
set cursorline
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.*.swp,*.pyc
set nobackup
set nowritebackup
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
set linebreak
set updatetime=300
set shortmess+=c
set signcolumn=number
set tws=8x0
filetype plugin on
filetype plugin indent on
filetype indent on
filetype on
syntax on
vnoremap < <gv
vnoremap > >gv
nnoremap < <<
nnoremap > >>
au BufRead,BufNewFile *.html setfiletype htmldjango

"""""""""""""""""""""""""""""" NerdTree settings
nnoremap <C-l> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIgnore=['node_modules', '\.git$', '\.vim$', '\.ropeproject']
let g:NERDTreeShowHidden = 1
let g:NERDTreeStatusline = ''
let g:NERDTreeMinimalUI = 1

"""""""""""""""""""""""""""""" Terminal settings
nmap <C-t> :bo term<CR>

"""""""""""""""""""""""""""""" vim-commentary settings
nmap cc :Commentary<CR>
vmap <silent> cc :Commentary<CR>

"""""""""""""""""""""""""""""" vim-plug settings
let g:plug_threads = 16
let g:plug_timeout = 60
let g:plug_retries = 2
let g:plug_shallow = 1
let g:plug_window = 'vertical topleft new'
let g:plug_pwindow = 'above 12new'
let g:plug_url_format = 'https://git::@github.com/%s.git'

"""""""""""""""""""""""""""""" fzf settings
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_tags_command = 'ctags -R'
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
nmap <C-o> :FZF<CR>
nmap <C-f> :Ag<CR>

"""""""""""""""""""""""""""""" editorconfig settings
let g:editorconfig_blacklist = {'filetype': ['git.*', 'fugitive']}
let g:editorconfig_verbose = 0

"""""""""""""""""""""""""""""" airline settings
let g:airline_section_z = '%=%(%l,%c %P%)'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '

"""""""""""""""""""""""""""""" windows, tabs and buffers settings
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>
nnoremap bb :Buffers<CR>
nmap <C-X> :Bclose<CR>
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>

"""""""""""""""""""""""""""""" colorscheme settings
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white })
  augroup END
endif
if (has("autocmd"))
  augroup colorextend
    autocmd!
    autocmd ColorScheme * call onedark#extend_highlight("CursorLineNr", { "bg": { "gui": "#2C323C" } })
  augroup END
endif
let g:onedark_terminal_italics=1
set background=dark
colorscheme onedark
highlight ExtraWhitespace ctermbg=1
match ExtraWhitespace /\s\+$/

"""""""""""""""""""""""""""""" when used as an IDE (with the `v` alias)
if exists('fullscreen')
  au VimEnter * vsplit
endif
