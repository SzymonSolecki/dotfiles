return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        ruff_lsp = function()
          require("lazyvim.util").lsp.on_attach(function(client, bufnr)
            if client.name == "ruff_lsp" then
              -- Disable hover in favor of Pyright
              client.server_capabilities.hoverProvider = false

              vim.api.nvim_create_autocmd("BufWritePre", {
                callback = function()
                  vim.lsp.buf.code_action({ context = { only = { "source.fixAll" } }, apply = true })
                end,
                buffer = bufnr,
              })
            end
          end)
        end,
      },
      servers = {
        ruff_lsp = {},
        pyright = {
          settings = {
            python = {
              analysis = {
                autoImportCompletion = true,
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                typeCheckingMode = "basic",
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
      },
    },
  },
}
