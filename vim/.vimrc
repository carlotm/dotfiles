"""""""""""""""""""""""""""""" vim-plug automatic install
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'carlotm/tokyonight-vim', { 'branch': 'dev' }
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'sgur/vim-editorconfig'
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale'
Plug 'elixir-editors/vim-elixir'
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

"""""""""""""""""""""""""""""" ale settings
let g:ale_change_sign_column_color = 0
let g:ale_close_preview_on_insert = 1
let g:ale_command_wrapper = 'nice -n5'
let g:ale_completion_delay = 100
let g:ale_completion_enabled = 1
let g:ale_completion_tsserver_remove_warnings = 0
let g:ale_completion_autoimport = 1
let g:ale_completion_max_suggestions = 10
let g:ale_cursor_detail = 1
let g:ale_detail_to_floating_preview = 1
let g:ale_disable_lsp = 0
let g:ale_echo_cursor = 1
let g:ale_echo_delay = 10
let g:ale_echo_msg_error_str = 'SUCA'
let g:ale_echo_msg_format = '%linter% DICE %code: %%s'
let g:ale_echo_msg_info_str = 'Info'
let g:ale_echo_msg_log_str = 'Log'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_enabled = 1
let g:ale_fixers = {
    \ 'python': ['isort', 'black']
    \ }
let g:ale_fix_on_save = 1
let g:ale_fix_on_save_ignore = {}
let g:ale_floating_preview = 1
let g:ale_floating_window_border = [' ', ' ', ' ', ' ', ' ', ' ']
let g:ale_history_enabled = 0
let g:ale_history_log_output = 0
let g:ale_hover_cursor = 1
let g:ale_hover_to_preview = 1
let g:ale_hover_to_floating_preview = 1
let g:ale_keep_list_window_open = 0
let g:ale_list_window_size = 10
let g:ale_lint_delay = 200
let g:ale_lint_on_enter = 1
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_linters = {
  \   'elixir': ['credo', 'dialyxir', 'dogma'],
  \   'python': ['black', 'flake8', 'isort', 'autoimport', 'pyright'],
  \   'vue': ['eslint', 'vls'],
  \}
let g:ale_linters_explicit = 1
let g:ale_linters_ignore = {'python': ['pylint']}
let g:ale_list_vertical = 0
let g:ale_lsp_show_message_format = 'LSP %severity%:%linter%: %s'
let g:ale_lsp_suggestions = 0
let g:ale_max_buffer_history_size = 10
let g:ale_max_signs = -1
let g:ale_open_list = 0
let g:ale_root = {}
let g:ale_set_highlights = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_set_signs = 1
let g:ale_sign_priority = 30
let g:ale_sign_column_always = 0
let g:ale_sign_error = '>'
let g:ale_sign_info = '-'
let g:ale_sign_style_error = '>'
let g:ale_sign_style_warning = '-'
let g:ale_sign_warning = '-'
let g:ale_sign_highlight_linenrs = 0
let g:ale_update_tagstack = 1
let g:ale_virtualtext_cursor = 0
let g:ale_virtualtext_delay = 10
let g:ale_virtualtext_prefix = '> '
let g:ale_virtualenv_dir_names = ['.env', '.venv', 'env', 've-py3', 've', 'virtualenv', 'venv']
let g:ale_warn_about_trailing_blank_lines = 1
let g:ale_warn_about_trailing_whitespace = 1

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
let g:airline#extensions#ale#enabled = 1
let g:airline_section_z = '%=%(%l,%c %P%)'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline_theme = "tokyonight"

"""""""""""""""""""""""""""""" windows, tabs and buffers settings
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>
nnoremap bb :Buffers<CR>
nmap <C-X> :bd<CR>
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
let g:tokyonight_style = 'night'
let g:tokyonight_transparent_background = 0
let g:tokyonight_menu_selection_background = 'green'
let g:tokyonight_disable_italic_comment = 0
let g:tokyonight_enable_italic = 0
let g:tokyonight_cursor = 'auto'
let g:tokyonight_current_word = 'grey background'
colorscheme tokyonight

highlight ExtraWhitespace ctermbg=1
match ExtraWhitespace /\s\+$/

"""""""""""""""""""""""""""""" open vim help in a vertical split
augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END

"""""""""""""""""""""""""""""" when used as an IDE (with the `v` alias)
if exists('fullscreen')
  au VimEnter * vsplit
endif
