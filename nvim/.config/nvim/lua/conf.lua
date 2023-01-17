require'nvim-treesitter.configs'.setup {
  ensure_installed = { "elixir", "heex" },
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}

require('Comment').setup({
  ignore = '^$',
  mappings = {
    basic = true,
    extra = false,
    extended = false,
  },
})

require("no-neck-pain").setup({
    debug = false,
    enableOnVimEnter = false,
    width = 100,
    toggleMapping = "<Leader>np",
    disableOnLastBuffer = false,
    killAllBuffersOnDisable = false,
    buffers = {
        setNames = false,
        -- backgroundColor = "#ff0000",
        blend = 0,
        textColor = "#ff0000",
        bo = {
            filetype = "no-neck-pain",
            buftype = "nofile",
            bufhidden = "hide",
            buflisted = false,
            swapfile = false,
        },
        wo = {
            cursorline = false,
            cursorcolumn = false,
            number = false,
            relativenumber = false,
            foldenable = false,
            list = false,
            wrap = true,
            linebreak = true,
        },
        left = NoNeckPain.bufferOptions,
        right = NoNeckPain.bufferOptions,
    }
})
