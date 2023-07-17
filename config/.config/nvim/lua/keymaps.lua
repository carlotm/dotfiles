vim.api.nvim_set_keymap("n", ">", ">>", { noremap = true, silent = true });
vim.api.nvim_set_keymap("n", "<", "<<", { noremap = true, silent = true });
vim.api.nvim_set_keymap("v", ">", ">>", { noremap = true, silent = true });
vim.api.nvim_set_keymap("v", "<", "<<", { noremap = true, silent = true });
vim.api.nvim_set_keymap("n", "gp", ":bprev<CR>", { silent = true });
vim.api.nvim_set_keymap("n", "gn", ":bnext<CR>", { silent = true });
vim.api.nvim_set_keymap("n", "<Leader>ww", ":wincmd w<CR>", { silent = true });
vim.api.nvim_set_keymap("n", "<Leader>bd", ":bp|bd #<CR>", { silent = true });