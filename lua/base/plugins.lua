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
		-- 通知
		"rcarriga/nvim-notify",
		priority = 90,
	},
}

M.views = {
	{
		"nvim-lualine/lualine.nvim",
		event = { "UIEnter" },
	}
}

lazy.entry(M)

return M
