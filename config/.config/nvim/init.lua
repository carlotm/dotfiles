require("core")
require("plugins")
require("keymaps")
require("colors")
require("misc")
require("syntax")
require("finders")
require("file_manager")
require("lsp")
-- Trailing whitespaces
vim.cmd([[
    highlight RedundantSpaces ctermbg=196
    match RedundantSpaces /\s\+$/
]])
