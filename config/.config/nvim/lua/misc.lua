vim.cmd.highlight({"TrailingWhitespaces", "guibg=red" })
vim.cmd([[ match TrailingWhitespaces /\s\+$/ ]])
