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