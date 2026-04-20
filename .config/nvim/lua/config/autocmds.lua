-- Set tmux window title to nvim-{foldername} when inside tmux
if vim.env.TMUX then
  local folder = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
  vim.fn.system("tmux rename-window 'nvim " .. folder .. "'")
  vim.api.nvim_create_autocmd("VimLeave", {
    callback = function()
      vim.fn.system("tmux set-window-option automatic-rename on")
    end,
  })
end

vim.filetype.add({
  extension = {
    mjml = "html",
  },
})
