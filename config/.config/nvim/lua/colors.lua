vim.cmd.highlight({"CursorColumn",  "ctermbg=252 cterm=None" })
vim.cmd.highlight({"CursorLine",    "ctermbg=252 cterm=None" })
vim.cmd.highlight({"CursorLineNr",  "ctermbg=252 ctermfg=8 cterm=None" })
vim.cmd.highlight({"StatusLine",    "ctermfg=18 ctermbg=15" })
vim.cmd.highlight({"StatusLineNC",  "ctermfg=252 ctermbg=244" })
vim.cmd.highlight({"String",        "ctermfg=2 ctermbg=None" })
vim.cmd.highlight({"LineNr",        "ctermfg=248 ctermbg=255" })
vim.cmd.highlight({"Search",        "ctermbg=226 ctermfg=8" })
vim.cmd.highlight({"MatchParen",    "ctermbg=15" })
vim.cmd.highlight({"WinSeparator",  "ctermfg=18 ctermbg=None" })
-- Syntax
vim.cmd.highlight({"Comment",       "ctermfg=244" })
vim.cmd.highlight({"Statement",     "ctermfg=125" })
vim.cmd.highlight({"Type",          "ctermfg=18" })
-- Telescope
vim.cmd.highlight({"TelescopeSelection", "ctermbg=194" })
vim.cmd.highlight({"RedundantSpaces", "ctermbg=196" })
vim.cmd([[
    match RedundantSpaces /\s\+$/
]])
