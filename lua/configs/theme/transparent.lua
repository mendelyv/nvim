-- https://github.com/xiyaowong/transparent.nvim

local M = {
  requires = {
    "transparent",
  }
}

function M.load()
  return
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
  })
end

return M
