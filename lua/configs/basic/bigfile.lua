-- https://github.com/LunarVim/bigfile.nvim

local M = {
  requires = {
    "bigfile",
  },
}

function M.load()
  M.bigfile.setup({
    filesize = 5,
  })
end

return M
