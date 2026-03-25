-- https://github.com/xiyaowong/transparent.nvim

local options = require("base.options")
local highlight = require("utils.highlight")

local M = {
  requires = {
    "transparent",
  }
}

function M.before()
  vim.api.nvim_create_user_command(
    "TransparentON",
    function()
      M.toggle(true)
    end,
    { range = true }
  )

  vim.api.nvim_create_user_command(
    "TransparentOFF",
    function()
      M.toggle(false)
    end,
    { range = true }
  )
end

function M.load()
  -- M.transparent.clear_prefix("lualine")
  M.transparent.setup({
    extra_groups = {
      "FloatBorder",
      "NormalFloat",    -- plugins which have float panel such as Lazy, Mason, LspInfo

      "NvimTreeNormal", -- NvimTree
      "NvimTreeEndOfBuffer",

      "LspFloatWinBorder",
      "LspSagaHoverBorder",

      "BlinkCmpMenu",
      "BlinkCmpMenuBorder",
      "BlinkCmpDocBorder",
      "BlinkCmpSignatureHelpBorder",

      "RenderMarkdownCode",
      "RenderMarkdownCodeInfo",
      "RenderMarkdownCodeBorder",
      "RenderMarkdownCodeFallback",
      "RenderMarkdownCodeInline",
    },
    exclude_groups = {
      "CursorLine",
    },
  })
end

function M.after()
  if options.transparent then
    vim.cmd("TransparentEnable")
    highlight.overwrite_cursor_line_number_highlight()
  else
    vim.cmd("TransparentDisable")
    highlight.overwrite_all_highlight()
  end
end

function M.toggle(on)
  if on then
    vim.cmd("TransparentEnable")
    highlight.overwrite_cursor_line_number_highlight()
  else
    vim.cmd("TransparentDisable")
    highlight.overwrite_all_highlight()
  end
end

return M
