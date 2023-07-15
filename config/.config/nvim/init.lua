-- Plugs --------------------------------------------------
vim.cmd([[
    let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
    if empty(glob(data_dir . '/autoload/plug.vim'))
        silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
]])
vim.call('plug#begin', '~/.config/nvim/plugged')
vim.fn['plug#']('nvim-treesitter/nvim-treesitter')
vim.fn['plug#']('nvim-lua/plenary.nvim')
vim.fn['plug#']('nvim-telescope/telescope.nvim')
vim.fn['plug#']('tpope/vim-commentary')
vim.call('plug#end')

-- General settings ---------------------------------------
vim.o.relativenumber = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.showmatch = true
vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.o.mouse = ""
vim.o.tabstop = 8
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.termguicolors = false
vim.o.background = "light"
vim.g.mapleader = " "

-- Key mappings -------------------------------------------
vim.api.nvim_set_keymap("n", ">", ">>", { noremap = true, silent = true });
vim.api.nvim_set_keymap("n", "<", "<<", { noremap = true, silent = true });
vim.api.nvim_set_keymap("v", ">", ">>", { noremap = true, silent = true });
vim.api.nvim_set_keymap("v", "<", "<<", { noremap = true, silent = true });

-- Colors -------------------------------------------------
vim.cmd.highlight({"CursorColumn", "ctermbg=252 cterm=None" })
vim.cmd.highlight({"CursorLine", "ctermbg=252 cterm=None" })
vim.cmd.highlight({"CursorLineNr", "ctermbg=252 cterm=None" })
vim.cmd.highlight({"StatusLine", "ctermfg=20 ctermbg=15" })
vim.cmd.highlight({"String", "ctermfg=2 ctermbg=None" })

-- Trailing whitespaces -----------------------------------
vim.cmd.highlight({"TrailingWhitespaces", "guibg=red" })
vim.cmd([[ match TrailingWhitespaces /\s\+$/ ]])

-- Treesitter ---------------------------------------------
require'nvim-treesitter.configs'.setup({
    ensure_installed = { "bash"
                       , "css"
                       , "elixir"
                       , "erlang"
                       , "heex"
                       , "html"
                       , "htmldjango"
                       , "javascript"
                       , "json"
                       , "lua"
                       , "markdown"
                       , "python"
                       , "sql"
                       , "yaml"
                       },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})

-- Telescope ----------------------------------------------
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})
