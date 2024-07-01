-- https://github.com/stevearc/aerial.nvim

local keymap = require('utils.keymap')

local M = {
  requires = {
    "aerial",
  },
}

function M.before() end

function M.load()
  M.aerial.setup({
    show_guides = true,
    backends = { "lsp", "treesitter", "markdown" },
    update_events = "TextChanged,InsertLeave",
    on_attach = function(bufnr)
      M.register_key()
    end,
    layout = {
      min_width = 60,
      default_direction = "float",
      -- max_width = { 40, 0.2 },
      win_opts = {
        cursorline = true,
        number = true,
        relativenumber = true,
      },
    },
    lsp = {
      diagnostics_trigger_update = false,
      update_when_errors = true,
      update_delay = 300,
    },
    close_on_select = true,
    nerd_font = "auto",
    -- guides = {
    --     mid_item = "├─",
    --     last_item = "└─",
    --     nested_top = "│ ",
    --     whitespace = "  ",
    -- },
    filter_kind = {
      "Class",
      "Constructor",
      "Enum",
      "Function",
      "Interface",
      "Module",
      "Method",
      "Struct",
      "Property",
    },
    keymaps = {
      ["o"] = "actions.jump",
      ["<c-[>"] = "actions.close",
    },
  })
end

function M.after() end

function M.register_key()
  keymap.register_all({
    {
      mode = { "n" },
      lhs = "<leader>2",
      rhs = "<cmd>AerialToggle<cr>",
      options = { silent = true },
      description = "Open Outilne Explorer",
    },
    -- {
    --   mode = { "n" },
    --   lhs = "{",
    --   rhs = "<cmd>AerialPrev<cr>",
    --   options = { silent = true },
    --   description = "Move item up",
    -- },
    -- {
    --   mode = { "n" },
    --   lhs = "}",
    --   rhs = "<cmd>AerialNext<cr>",
    --   options = { silent = true },
    --   description = "Move item down",
    -- },
    -- {
    --   mode = { "n" },
    --   lhs = "[[",
    --   rhs = "<cmd>AerialPrevUp<cr>",
    --   options = { silent = true },
    --   description = "Move up one level",
    -- },
    -- {
    --   mode = { "n" },
    --   lhs = "]]",
    --   rhs = "<cmd>AerialNextUp<cr>",
    --   options = { silent = true },
    --   description = "Move down one level",
    -- },
  })
end

return M
