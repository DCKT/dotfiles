require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<C-9>", vim.diagnostic.goto_prev)
map("n", "<C-0>", vim.diagnostic.goto_next)
