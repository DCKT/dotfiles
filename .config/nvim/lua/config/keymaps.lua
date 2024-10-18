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

-- New tab
keymap.set("n", "te", "tabedit", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)

-- Toggle term
keymap.set("n", "<C-i>", ":ToggleTerm<Return>", opts)

-- Package-info
vim.api.nvim_set_keymap("n", "<leader>np", "<cmd>lua require('package-info').change_version()<cr>", opts)

-- neo-tree
keymap.set("n", "<C-d>", ":Neotree focus<Return>", opts)

-- oil
keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
