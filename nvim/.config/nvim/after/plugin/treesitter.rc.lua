require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "json",
    "javascript",
    "yaml",
    "html",
    "scss",
    "python",
    "rust"
  },
}
