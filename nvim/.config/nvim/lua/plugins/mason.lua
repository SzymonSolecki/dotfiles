return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",

        -- python stuff
        "pyright",
        "ruff-lsp",
        "isort",
      },
    },
  },
}
