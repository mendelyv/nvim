-- https://github.com/echasnovski/mini.indentscope

local M = {
  requires = {
    "mini.indentscope",
  },
}

function M.before()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = {
      "help",
      "alpha",
      "dashboard",
      "neo-tree",
      "Trouble",
      "trouble",
      "lazy",
      "mason",
      "notify",
      "toggleterm",
      "lazyterm",
    },
    callback = function()
      vim.b.miniindentscope_disable = true
    end,
  })
end

function M.load()
  M.mini_indentscope.setup({
    symbol = "│",
  })
end

return M
