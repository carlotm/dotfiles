require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {"elixirls", "eslint", "stylelint_lsp"}
})

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require("cmp")

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            else
                fallback()
            end
        end, { "i", "s" })
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "vsnip" },
    }, {
        { name = "buffer" },
    })
})

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

vim.diagnostic.config({
  virtual_text = {
    source = "never",
    prefix = "▸",
    severity = {
      min = vim.diagnostic.severity.ERROR,
    },
  },
  float = {
    source = "always",
  },
  signs = true,
  underline = false,
  update_in_insert = false,
  severity_sort = true,
})

vim.o.updatetime = 120
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

vim.cmd [[
  highlight! DiagnosticLineNrError ctermbg=9 ctermfg=15
  highlight! DiagnosticLineNrWarn ctermbg=11 ctermfg=15
  highlight! DiagnosticLineNrInfo ctermbg=12 ctermfg=15
  highlight! DiagnosticLineNrHint ctermbg=2 ctermfg=15

  sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
  sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
  sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
  sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]]

local on_attach = function(client, bufnr)
	-- auto refresh code lens
	vim.api.nvim_create_autocmd({'CursorHold','CursorHoldI','InsertLeave'}, {
		pattern = '*',
		callback = vim.lsp.codelens.refresh
	})

	vim.api.nvim_create_autocmd('LspDetach', {
		callback = function(opt)
			vim.lsp.codelens.clear(opt.data.client_id, opt.buf)
		end
	})

    local opts = { noremap=true, silent=true }

    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fo", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

lspconfig.elixirls.setup({ cmd = {"elixir-ls"}
                         , capabilities = capabilities
                         , on_attach = on_attach
						 , settings = { elixirls = { enableTestLenses = true
												   , suggestSpecs = true
												   }
									  }
						 })
lspconfig.eslint.setup({ capabilities = capabilities
                       , on_attach = on_attach
                       })
lspconfig.stylelint_lsp.setup({ capabilities = capabilities
                              , on_attach = on_attach
                              })
