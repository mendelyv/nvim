-- https://github.com/RRethy/vim-illuminate

local M = {
  requires = {
    "illuminate",
  },
}

function M.load()
  M.illuminate.configure({
    delay = 100,
    under_cursor = true,
    modes_denylist = { "i" },
    providers = {
      --[[ "lsp", ]]
      "regex",
      "treesitter",
    },
    filetypes_denylist = {
      "NvimTree",
      "aerial",
      "undotree",
      "dbui",
      "spectre_panel",
      "help",
      "lazy",
      "mason",
      "notify",
      "lspinfo",
      "toggleterm",
      "TelescopePrompt",
    },
  })
end

return M
