local M = {}

function M.load()
  vim.g.everforest_background = 'soft'
  vim.cmd [[colorscheme everforest]]
end

return M
