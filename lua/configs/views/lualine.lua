-- https://github.com/nvim-lualine/lualine.nvim

local icons = require("utils.icons").get_icons("diagnostic_thin", true)

local M = {
  requires = {
    "lualine",
  },
}

local function diff_source()
  -- require gitsigns
  ---@diagnostic disable-next-line: undefined-field
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

function M.before() end

function M.load()
  M.lualine.setup({
    options = {
      theme = "auto",
      icons_enabled = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {},
      globalstatus = true,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = {
        { "mode" },
      },
      lualine_b = {
        "branch",
        { "diff", source = diff_source },
        {
          "diagnostics",
          source = { "nvim_lsp" },
          symbols = {
            error = icons.Error,
            warn = icons.Warn,
            info = icons.Info,
            hint = icons.Hint,
          },
        },
      },
      lualine_c = {
        "filename",
      },
      lualine_x = {
        "encoding",
        "fileformat",
        "filetype",
      },
      lualine_y = {
        "progress",
      },
      lualine_z = { "location" },
    },
  })
end

function M.after() end

return M
