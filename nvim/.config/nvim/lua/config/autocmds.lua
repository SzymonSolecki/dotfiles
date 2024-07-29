-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
-- Copy yanked text to windows clipboard if on WSL
if vim.fn.has("wsl") == 1 then
  vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
      vim.schedule(function()
        vim.fn.system("clip.exe", vim.fn.getreg("0"))
      end)
    end,
  })
end
