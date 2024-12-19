-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", ";", ":")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_prev()
end)
keymap.set("n", "<C-k>", function()
  vim.diagnostic.goto_next()
end)

-- Toggle term
vim.keymap.set({ "n", "t" }, "<leader>t", "<cmd>:ToggleTerm<cr>", opts)

-- Package-info
vim.api.nvim_set_keymap("n", "<leader>np", "<cmd>lua require('package-info').change_version()<cr>", opts)

-- neo-tree
-- With toggle implemention
keymap.set("n", "<C-p>", function()
  local function is_neo_tree_open()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.bo[buf].filetype == "neo-tree" then
        return true
      end
    end
    return false
  end
  if is_neo_tree_open() then
    vim.cmd("Neotree close")
  else
    vim.cmd("Neotree reveal")
  end
end, opts)

-- Run lua code from current line
keymap.set("n", "<space>y", ":.lua<CR>", opts)
-- Run lua code from current selection
keymap.set("v", "<space>y", ":lua<CR>", opts)
