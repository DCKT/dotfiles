return {
  "ibhagwan/fzf-lua",
  opts = {

    files = {
      fd_opts = [[--color=never --type f --type l --exclude .git --exclude repos]],
    },
    grep = {
      rg_opts = "--column --line-number --no-heading --color=always --smart-case --glob '!repos/**' ",
    },
    winopts = {
      preview = {
        layout = "vertical",
        vertical = "down:70%",
      },
      fullscreen = true,
    },
  },
}
