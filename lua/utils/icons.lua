local M = {}

M.diagnostic = {
    Error = "",
    Warn = "",
    Info = "",
    Hint = "",
}

M.diagnostic_thin = {
    Error = "",
    Warn = "",
    Info = "ﬤ",
    Hint = "",
}

M.tag_level = {
    Fixme = "ﰡ",
    Hack = "ﰠ",
    Warn = "",
    Note = "ﮉ",
    Todo = "ﮉ",
    Perf = "ﮉ",
}

M.lsp_kind = {
    -- lsp type
    String = "",
    Number = "",
    Boolean = "◩",
    Array = "",
    Object = "",
    Key = "",
    Null = "ﳠ",
    -- lsp kind
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Namespace = "",
    Field = "ﰠ",
    Variable = "ﳋ",
    Class = "",
    Interface = "",
    Module = "ﰪ",
    Property = "",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "﬌",
    Event = "",
    Operator = "",
    TypeParameter = "",
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
