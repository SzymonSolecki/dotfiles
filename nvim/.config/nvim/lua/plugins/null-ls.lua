if true then
  return {}
end
return {
  "nvimtools/none-ls.nvim",

  dependencies = {
    "ThePrimeagen/refactoring.nvim",
  },

  opts = function()
    local nls = require("null-ls")
    return {
      sources = {
        nls.builtins.code_actions.refactoring,
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.isort,
        nls.builtins.formatting.autopep8,
      },
    }
  end,
}
