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

lazy.entry(M)

return M
