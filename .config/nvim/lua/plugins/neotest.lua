if true then
  return {}
end

return {
  "nvim-neotest/neotest",
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-python"),
      },
    })
  end,
  ft = { "python" },
  dependencies = {
    "nvim-neotest/neotest-python",
  },

  opts = {},
  keys = {
    { "<leader>tr", "<cmd>:lua require('neotest').run.run()<cr>" },
    { "<leader>td", "<cmd>:lua require('neotest').run.run({strategy = 'dap'})<cr>" },
    { "<leader>te", "<cmd>:lua require('neotest').summary.toggle()<cr>" },
  },
}
