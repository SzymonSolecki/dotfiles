-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jk", "<Esc>", { desc = "Escape", noremap = true, silent = true })
vim.keymap.set("i", "kj", "<Esc>", { desc = "Escape", noremap = true, silent = true })

vim.keymap.set("x", "<leader>p", '"_dP', { noremap = true, silent = true })

-- at some point lazyvim added floaty terminal under this keybinding
-- and there was no way to overrite it in any other way
vim.keymap.set("n", "<c-_>", function()
  local mc = require("mini.comment")
  return mc.operator() .. "_"
end, { expr = true, desc = "Comment" })
