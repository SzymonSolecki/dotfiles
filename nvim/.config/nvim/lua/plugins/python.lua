return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {
        settings = {
          python = {
            analysis = {
              autoImportCompletion = true,
              autoSearchPaths = true,
              diagnosticMode = "openFilesOnly",
              typeCheckingMode = "basic",
              useLibraryCodeForTypes = true,
            },
          },
        },
      },
    },
  },
}
