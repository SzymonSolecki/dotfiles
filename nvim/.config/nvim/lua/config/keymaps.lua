-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

vim.keymap.set("i", "jk", "<Esc>", { desc = "Escape", noremap = true, silent = true })
vim.keymap.set("i", "kj", "<Esc>", { desc = "Escape", noremap = true, silent = true })

vim.keymap.set("x", "<leader>p", '"_dP', { noremap = true, silent = true })

-- at some point lazyvim added floaty terminal under this keybinding
-- and there was no way to overrite it in any other way
vim.keymap.set("n", "<c-_>", function()
  local mc = require("mini.comment")
  return mc.operator() .. "_"
end, { expr = true, desc = "Comment" })

local lazyterm = function()
  Util.float_term(nil, { cwd = Util.get_root() })
end
vim.keymap.set("n", "<C-Bslash>", lazyterm, { desc = "Terminal (root dir)" })
vim.keymap.set("t", "<C-Bslash>", "<cmd>close<cr>", { desc = "Hide Terminal" })
