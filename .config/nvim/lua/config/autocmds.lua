local split = function(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end

local cwdTable = split(vim.fn.getcwd(), "/")
local currentFolder = cwdTable[#cwdTable]

vim.fn.system({ "wezterm", "cli", "set-tab-title", "📝" .. currentFolder })

vim.api.nvim_create_autocmd({ "VimLeave" }, {
  callback = function()
    vim.fn.system({ "wezterm", "cli", "set-tab-title", "" })
  end,
})
