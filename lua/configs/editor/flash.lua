-- https://github.com/folke/flash.nvim

local M = {
  requires = {
    "flash",
  },
}

function M.load()
  M.flash.setup({
    modes = {
      search = {
        highlight = { backdrop = true },
      },
      char = {
        enabled = false,
        multi_line = false,
        highlight = { backdrop = true },
      }
    }
  })
end

return M
