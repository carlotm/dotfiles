vim9script

# Plugins {{{
var data_dir = "~/.vim"
if empty(glob(data_dir .. "/autoload/plug.vim"))
  silent execute "!curl -fLo ".data_dir."/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

plug#begin("~/.vim/plugged")
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yegappan/lsp'
Plug 'editorconfig/editorconfig-vim'
Plug 'elixir-editors/vim-elixir'
plug#end()
# }}}

# Vim settings {{{
set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
set background=dark
set noexpandtab tabstop=4 shiftwidth=4
set nobackup
set scrolloff=10
set incsearch hlsearch
set ignorecase smartcase
set showmatch
set foldmethod=marker
set fillchars+=vert:\│
set list
set listchars=tab:↳\ 
nnoremap <SPACE> <Nop>
g:mapleader = " "
# }}}

# Colors {{{
highlight Comment ctermfg=8
highlight Visual ctermbg=236
highlight VertSplit ctermfg=4 ctermbg=16 cterm=NONE
highlight StatusLine ctermfg=15 ctermbg=4 cterm=NONE
highlight StatusLineNC ctermfg=8 ctermbg=234
highlight ExtraWhitespace ctermbg=1
highlight SpecialKey ctermfg=235
highlight Folded ctermbg=234 ctermfg=6
highlight SignColumn ctermbg=234
highlight LspDiagInlineError ctermbg=52
highlight LspDiagSignErrorText ctermbg=52
highlight LspDiagInlineWarning ctermbg=3 ctermfg=16
highlight LspDiagSignWarningText ctermbg=3 ctermfg=16
match ExtraWhitespace /\s\+$/
# }}}

# Key mappings {{{
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>
vnoremap < <gv
vnoremap > >gv
nnoremap < <<
nnoremap > >>
nnoremap gn :bnext<CR>
nnoremap gp :bprev<CR>
nnoremap <Leader>bd :bdelete<CR>
nnoremap <Leader>ww :wincmd w<CR>
nnoremap <Leader>ff :GFiles<CR>
nnoremap <Leader>fa :Files<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fg :Rg<CR>
nnoremap K :LspHover<CR>
nnoremap gd :LspGotoDefinition<CR>
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
# }}}

# LSP {{{
var lspErlang = []
if executable('erlang_ls')
	lspErlang = [{
		name: 'erlangls',
		filetype: ['erlang'],
		path: 'erlang_ls',
		args: []
	}]
endif
var lspElixir = []
if executable('elixir-ls')
	lspElixir = [{
		name: 'elixirls',
		filetype: ['elixir'],
		path: 'elixir-ls',
		args: []
	}]
endif
autocmd VimEnter * call LspAddServer(lspErlang + lspElixir)
const lspOpts = {
	aleSupport: v:false,
	autoComplete: v:true,
	autoHighlight: v:false,
	autoHighlightDiags: v:true,
	autoPopulateDiags: v:false,
	completionMatcher: 'case',
	completionTextEdit: v:true,
	completionKinds: {},
	customCompletionKinds: v:false,
	diagSignErrorText: 'E>',
	diagSignInfoText: 'I>',
	diagSignHintText: 'H>',
	diagSignWarningText: 'W>',
	diagVirtualTextAlign: 'above',
	echoSignature: v:false,
	hideDisabledCodeActions: v:false,
	highlightDiagInline: v:true,
	hoverInPreview: v:true,
	ignoreMissingServer: v:false,
	keepFocusInReferences: v:false,
	noNewlineInCompletion: v:false,
	outlineOnRight: v:false,
	outlineWinSize: 20,
	showDiagInBalloon: v:true,
	showDiagInPopup: v:true,
	showDiagOnStatusLine: v:false,
	showDiagWithSign: v:true,
	showDiagWithVirtualText: v:false,
	showInlayHints: v:false,
	showSignature: v:true,
	snippetSupport: v:false,
	ultisnipsSupport: v:false,
	usePopupInCodeAction: v:false,
	useQuickfixForLocations: v:false,
	useBufferCompletion: v:false,
}
autocmd VimEnter * call LspOptionsSet(lspOpts)
augroup LspCustom
  au!
  au CursorMoved * silent! LspDiagCurrent
augroup END
# }}}

# Misc {{{
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex,*.heex,*.leex,*.lexs set filetype=eelixir
# }}}
