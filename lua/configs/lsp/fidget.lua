-- https://github.com/j-hui/fidget.nvim

local M = {
  requires = {
    "fidget",
  },
}

function M.before() end

function M.load()
  M.fidget.setup()
end

function M.after() end

return M
