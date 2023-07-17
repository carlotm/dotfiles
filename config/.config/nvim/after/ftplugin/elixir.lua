vim.api.nvim_create_autocmd({"BufWritePre"}, {
    callback = function(ev)
        vim.lsp.buf.format()
    end
})
