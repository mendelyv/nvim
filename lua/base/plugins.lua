local lazy = require("utils.plugins.lazy")

local M = {}

M.theme = {
	{
		"sainnhe/everforest",
		-- 优先级
		priority = 100,
	}
}

M.basic = {
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},
	{
		-- 通知
		"rcarriga/nvim-notify",
		priority = 90,
	},
}

M.views = {
	{
		"nvim-tree/nvim-web-devicons",
		event = { "VimEnter" },
	},
	{
		"nvim-lualine/lualine.nvim",
		event = { "UIEnter" },
	},
}

lazy.entry(M)

return M
