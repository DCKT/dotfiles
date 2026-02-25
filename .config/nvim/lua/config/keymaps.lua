-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", ";", ":")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Diagnostics
keymap.set("n", "<C-h>", function()
  vim.diagnostic.jump({ count = -1, float = true })
end)
keymap.set("n", "<C-l>", function()
  vim.diagnostic.jump({ count = 1, float = true })
end)

-- ToggleTerm
keymap.set({ "n", "t", "v" }, "<C-o>", "<cmd>:ToggleTerm<CR>", opts)

-- Open FzfLua with LSP document symbols
vim.api.nvim_set_keymap("n", "<leader>sp", "<cmd>FzfLua lsp_document_symbols<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>se", "<cmd>FzfLua diagnostics_workspace<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>sn", "<cmd>FzfLua git_status<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>si", "<cmd>FzfLua lsp_references <cword><cr>", opts)

-- Insert git branch name
vim.api.nvim_set_keymap(
  "n",
  "<leader>ib",
  ":execute \"normal! a\" . system('git symbolic-ref --short HEAD')[0:-2]<cr>",
  vim.tbl_extend("force", opts, { desc = "git branch" })
)

-- Package-info
vim.api.nvim_set_keymap("n", "<leader>np", "<cmd>lua require('package-info').change_version()<cr>", opts)

vim.keymap.set("v", "<leader>cp", ":s/_\\(.\\)/\\u\\1/g | s/^./\\u&/<CR>", { noremap = true, silent = true })

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

-- Line movements like VSCode
keymap.set("n", "<C-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap.set("n", "<C-k>", ":m .-2<CR>==", { desc = "Move line up" })
keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
