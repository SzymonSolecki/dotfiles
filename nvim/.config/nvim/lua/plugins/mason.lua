return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",

        -- golang
        "gopls",

        -- python stuff
        "pyright",
        "ruff-lsp",
        "isort",
      },
    },
  },
}
