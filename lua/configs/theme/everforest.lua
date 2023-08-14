local M = {}

function M.load()
  vim.g.everforest_background = 'soft'
  vim.g.everforest_disable_italic_comment = 1
  vim.cmd [[colorscheme everforest]]
end

return M
