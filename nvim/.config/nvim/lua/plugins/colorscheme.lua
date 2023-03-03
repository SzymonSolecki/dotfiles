return {
  {
    "Shatur/neovim-ayu",
    lazy = true,
    config = function()
      require("ayu").setup({
        mirage = true,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "ayu",
    },
  },
}
