-- https://github.com/lukas-reineke/indent-blankline.nvim

local M = {
  requires = {
    "ibl",
  },
}

function M.after()
  vim.api.nvim_set_hl(0, "@ibl.scope.char.1", { fg = "#B5B5B5" })
  -- vim.api.nvim_set_hl(0, "@ibl.scope.char.1", { fg = "#A7C082" })
end

function M.load()
  M.ibl.setup({
    indent = {
      char = "┊",
    },
    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
      char = "│",
    },
    exclude = {
      filetypes = {
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
    },
  })
end

return M
