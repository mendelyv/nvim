-- https://github.com/shellRaining/hlchunk.nvim

local M = {
  requires = {
    "hlchunk",
  }
}

function M.load()
  M.hlchunk.setup({
    chunk = {
      enable = false,
      style = {
        { fg = "#999999" },
      },
      notify = false,
    },
    indent = {
      enable = true,
      -- chars = { "┆" }
    },
    line_num = {
      enable = false,
      style = "#999999",
    },
    blank = {
      enable = false,
    }
  })
end

return M
