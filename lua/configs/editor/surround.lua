-- https://github.com/tpope/vim-repeat
-- https://github.com/ur4ltz/surround.nvim

local M = {
  requires = {
    "surround",
  },
}

function M.load()
  M.surround.setup({
    mappings_style = "surround",
    space_on_closing_char = true,
  })
end

return M
