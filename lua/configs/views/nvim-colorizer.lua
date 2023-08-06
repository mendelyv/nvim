-- https://github.com/norcalli/nvim-colorizer.lua

local M = {
  requires = {
    "colorizer",
  },
}

function M.load()
  M.colorizer.setup()
end

return M
