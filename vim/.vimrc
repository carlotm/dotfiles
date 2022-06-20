"""""""""""""""""""""""""""""" vim-plug automatic install
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf'
Plug 'sgur/vim-editorconfig'
Plug 'preservim/nerdtree'
Plug 'ap/vim-buftabline'
Plug 'qpkorr/vim-bufkill'
Plug 'sheerun/vim-polyglot'
Plug 'tomasiser/vim-code-dark'
Plug 'NLKNguyen/papercolor-theme'
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
set cursorline cursorcolumn
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
au BufRead,BufNewFile *.html setfiletype htmldjango

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
  \         'color00' : ['#d2d2d2', '232'],
  \         'linenumber_bg' : ['#d2d2d2', '232'],
  \         'linenumber_fg' : ['#999999', '232'],
  \         'cursorline' : ['#c9c9c9', '232'],
  \         'cursorlinenr_bg' : ['#c9c9c9', '232'],
  \         'cursorcolumn' : ['#c9c9c9', '232'],
  \       }
  \     }
  \   }
  \ }
colorscheme PaperColor
highlight ExtraWhitespace ctermbg=1
match ExtraWhitespace /\s\+$/

"""""""""""""""""""""""""""""" Key mapping
vnoremap < <gv
vnoremap > >gv
nnoremap < <<
nnoremap > >>
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>
nmap <C-X> :BD<CR>
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>

"""""""""""""""""""""""""""""" NerdTree settings
nnoremap <C-l> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIgnore=['node_modules', '\.git$', '\.vim$', '\.ropeproject']
let g:NERDTreeShowHidden = 1
let g:NERDTreeStatusline = ''
let g:NERDTreeMinimalUI = 1

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
let g:fzf_preview_window = ['down:40%', 'ctrl-/']
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_tags_command = 'ctags -R'
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
nmap <C-o> :FZF<CR>
nmap <C-f> :Ag<CR>

"""""""""""""""""""""""""""""" editorconfig settings
let g:editorconfig_blacklist = {'filetype': ['git.*', 'fugitive']}
let g:editorconfig_verbose = 0

"""""""""""""""""""""""""""""" status settings
let g:currentmode={
\ 'n'  : 'NORMAL ',
\ 'v'  : 'VISUAL ',
\ 'V'  : 'V·Line ',
\ "\<C-V>" : 'V·Block ',
\ 'i'  : 'INSERT ',
\ 'R'  : 'R ',
\ 'Rv' : 'V·Replace ',
\ 'c'  : 'COMMAND ',
\}
set statusline=
set statusline+=%#TabLineFill#
set statusline+=\ %{g:currentmode[mode()]}
set statusline+=%F
set statusline+=%=
set statusline+=%y
set statusline+=\ %l:%c\ 
set laststatus=2
set noshowmode

"""""""""""""""""""""""""""""" coc-vim settings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
let g:coc_global_extensions = ['coc-css', 'coc-diagnostic', 'coc-elixir', 'coc-eslint', 'coc-json', 'coc-prettier', 'coc-pyright', 'coc-tsserver', 'coc-yaml']
