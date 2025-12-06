-- https://github.com/folke/lazydev.nvim

local M = {
  requires = {
    "lazydev",
  }
}

function M.load()
  M.lazydev.setup()
end

return M
