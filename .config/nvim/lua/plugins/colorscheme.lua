return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,

    opts = {
      transparent_background = true,
      styles = {
        functions = { "italic" },
        booleans = { "bold" },
        variables = { "bold", "italic" },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
