-- https://github.com/lukas-reineke/indent-blankline.nvim

local M = {
	requires = {
		"indent_blankline",
	},
}

function M.before()
	vim.g.indent_blankline_filetype_exclude = {
		"help",
		"undotree",
	}
end

function M.load()
	M.indent_blankline.setup()
end

return M
