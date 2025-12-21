-- https://github.com/Saghen/blink.cmp

local highlight = require("utils.highlight")
local options = require("base.options")

local M = {
  requires = {
    "blink.cmp",
  },
}

function M.load()
  M.blink_cmp.setup({
    fuzzy = { implementation = "lua", },
    cmdline = {
      enabled = true,
      completion = {
        menu = {
          auto_show = true,
        },
      },
      keymap = {
        preset = "none",
        ['<c-p>'] = { 'select_prev', 'fallback' },
        ['<c-n>'] = { 'select_next', 'fallback' },

        ['<c-y>'] = false,

        ['<c-k>'] = { 'show', 'hide' },
        ['<tab>'] = { 'select_and_accept', 'fallback' },
        ['<c-j>'] = { 'show_signature', 'hide_signature', 'fallback' },
      }
    },
    appearance = {
      use_nvim_cmp_as_default = true,
    },
    completion = {
      documentation = {
        auto_show = true,
        window = {
          border = options.float_border and "rounded" or "none",
        },
      },
      list = {
        selection = {
          preselect = true,
          auto_insert = false,
        },
      },
      menu = {
        border = options.float_border and "rounded" or "none",
        draw = {
          -- We don't need label_description now because label and label_description are already
          -- combined together in label by colorful-menu.nvim.
          columns = { { "kind_icon" }, { "label", gap = 1 } },
          components = {
            label = {
              text = function(ctx)
                return require("colorful-menu").blink_components_text(ctx)
              end,
              highlight = function(ctx)
                return require("colorful-menu").blink_components_highlight(ctx)
              end,
            },
          },
        },
      },
      ghost_text = { enabled = false },
      accept = {
        auto_brackets = {
          enabled = false,
        },
      },
    },
    signature = {
      enabled = true,
      window = {
        border = options.float_border and "rounded" or "none",
      },
    },
    sources = {
      providers = {
        snippets = {
          score_offset = 5,
        },
      },
    },
    keymap = {
      preset = "none",
      ['<c-p>'] = { 'select_prev', 'fallback' },
      ['<c-n>'] = { 'select_next', 'fallback' },

      ['<c-y>'] = false,

      ['<c-k>'] = { 'show', 'hide' },
      ['<tab>'] = { 'select_and_accept', 'fallback' },
      ['<c-j>'] = { 'show_signature', 'hide_signature', 'fallback' },
    }
  })
end

function M.after()
  highlight.overwrite_blink_plugin_highlight()
end

return M
