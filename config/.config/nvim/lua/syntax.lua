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
