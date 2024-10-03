return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    ensure_installed = {
      "rescript",
      "gitignore",
      "json",
      "gitignore",
      "css",
      "go",
      "http",
      "vim",
      "typescript",
      "javascript",
      "lua",
      "html",
      "markdown",
      "markdown_inline",
      "yaml",
      "tsx",
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  },
}
