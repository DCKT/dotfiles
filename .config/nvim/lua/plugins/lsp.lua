return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      vtsls = {
        settings = {
          vtsls = {
            tsserver = {
              useWorkspaceTsdk = true,
            },
            experimental = {
              completion = {
                entriesLimit = 10,
              },
            },
          },
          typescript = {
            preferences = {
              autoImportFileExcludePatterns = { "repos/**" },
            },
            tsserver = {
              maxTsServerMemory = 8192,
            },
          },
          javascript = {
            preferences = {
              autoImportFileExcludePatterns = { "repos/**" },
            },
          },
        },
      },
    },
  },
}
