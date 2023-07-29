-- https://github.com/nvim-lualine/lualine.nvim

local M = {
	requires = {
		"lualine",
	},
}

function M.load()
	M.lualine.setup()
end

return M
