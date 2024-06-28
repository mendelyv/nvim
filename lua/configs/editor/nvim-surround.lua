-- https://github.com/kylechui/nvim-surround

local M = {
  requires = {
    "nvim-surround",
  },
}

function M.load()
  M.nvim_surround.setup()
end

return M
