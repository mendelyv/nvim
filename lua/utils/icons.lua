local M = {}

M.diagnostic = {
  Error = "",
  Warn = "",
  Info = "",
  Hint = "󰍩",
}

M.diagnostic_thin = {
  Error = "",
  Warn = "",
  Info = "",
  Hint = "󰍪",
}

M.tag_level = {
  Fixme = "󰁨", -- 表示需要修复的问题
  Hack = "󰜢", -- 表示在代码中使用了一些技巧或不常见的方法
  Warn = "󰓹", -- 表示警告，可能是代码中的一些潜在问题
  Note = "󰓹", -- 表示注释，可能是对代码的一些解释或说明
  Todo = "󱩺", -- 表示待办事项，需要在之后的工作中处理的任务
  Perf = "󱤇", -- 表示性能相关的事项，可能是优化的建议或注意事项
}

M.lsp_kind = {
  -- lsp type
  String = "",
  Number = "󰎠",
  Boolean = "",
  Array = "",
  Object = "󰅩",
  Key = "",
  Null = "󰟢",
  -- lsp kind
  Text = "",
  Method = "󰊕",
  Function = "󰊕",
  Constructor = "",
  Namespace = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "󰜬",
  Property = "",
  Unit = "󰕤",
  Value = "󱀍",
  Enum = "",
  Keyword = "",
  Snippet = "󱚛",
  Color = "",
  File = "",
  Reference = "",
  Folder = "󰉖",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

M.dashboard = {
  Session = "󰃨",
  Find = "󰍉",
  NewFile = "",
  Lazy = "󰒲",
  Quit = "",
}

-- 获取图标分组
-- space 是否需要整体添加空格
function M.get_icons(group_name, space)
  local icons = vim.deepcopy(M[group_name])
  if space then
    for tag, code in pairs(icons) do
      icons[tag] = ("%s "):format(code)
    end
  end
  return icons
end

return M
