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

require("zen-mode").setup({
  window = {
    backdrop = 1,
    width = 0.6,
    height = 1,
      options = {
      signcolumn = "no",
      number = false,
      relativenumber = false,
      cursorline = false,
      cursorcolumn = false,
      foldcolumn = "0",
      list = false,
    },
  },
  plugins = {
    options = {
      enabled = true,
      ruler = false,
      showcmd = false,
    },
    twilight = { enabled = true },
    gitsigns = { enabled = false },
    tmux = { enabled = false },
    alacritty = {
      enabled = true,
      font = "28",
    },
  },
  on_open = function(win) end,
  on_close = function() end,
})

require("twilight").setup({
})
