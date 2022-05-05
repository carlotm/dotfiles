"""""""""""""""""""""""""""""" vim-plug automatic install
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"""""""""""""""""""""""""""""" plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sgur/vim-editorconfig'
Plug 'preservim/nerdtree'
Plug 'ap/vim-buftabline'
Plug 'qpkorr/vim-bufkill'
"""""""""""""""""""""""""""""" syntax
Plug 'elixir-editors/vim-elixir'
"""""""""""""""""""""""""""""" colorschemes
Plug 'tomasiser/vim-code-dark'
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
au BufRead,BufNewFile *.html setfiletype htmldjango

"""""""""""""""""""""""""""""" Key mapping
vnoremap < <gv
vnoremap > >gv
nnoremap < <<
nnoremap > >>

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
set statusline+=\ %{g:currentmode[mode()]}
set statusline+=%F
set statusline+=%=
set statusline+=%y
set statusline+=\ %l:%c\ 
set laststatus=2
set noshowmode

"""""""""""""""""""""""""""""" windows, tabs and buffers settings
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>
nmap <C-X> :BD<CR>
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
set background=dark
colorscheme codedark
command! What echo synIDattr(synID(line('.'), col('.'), 1), 'name')
highlight ExtraWhitespace ctermbg=1
highlight TabLineSel guibg=#9ECE6A guifg=#1E1E1E
highlight TabLine ctermbg=1
match ExtraWhitespace /\s\+$/

"""""""""""""""""""""""""""""" open vim help in a vertical split
augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END

"""""""""""""""""""""""""""""" autocommands
autocmd BufRead,BufNewFile *.tpl set filetype=jinja
autocmd FileType css setl iskeyword+=-
autocmd FileType scss setl iskeyword+=@-@
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
autocmd BufNewFile,BufRead *.slime setlocal filetype=slim
autocmd BufRead,BufNewFile *.ex,*.exs set filetype=elixir
autocmd BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
autocmd BufRead,BufNewFile mix.lock set filetype=elixir

"""""""""""""""""""""""""""""" when used as an IDE (with the `v` alias)
if exists('fullscreen')
  au VimEnter * vsplit
endif
