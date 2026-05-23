return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",

        -- golang
        -- "gopls",

        -- python stuff
        "ruff",
        "ty",
      },
    },
  },
}
