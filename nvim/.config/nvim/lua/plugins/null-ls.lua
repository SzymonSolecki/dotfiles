return {
  "jose-elias-alvarez/null-ls.nvim",

  opts = function()
    local nls = require("null-ls")
    return {
      sources = {
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.isort,
        nls.builtins.formatting.autopep8,
      },
    }
  end,
}