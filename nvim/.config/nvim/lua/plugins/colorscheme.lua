-- return {
--   {
--     "Shatur/neovim-ayu",
--     lazy = true,
--     config = function()
--       require("ayu").setup({
--         mirage = true,
--       })
--     end,
--   },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "ayu",
--     },
--   },
-- }
return {
  {
    "loctvl842/monokai-pro.nvim",
    lazy = true,
    config = function()
      require("monokai-pro").setup({
        filter = "pro",
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-pro",
    },
  },
}
