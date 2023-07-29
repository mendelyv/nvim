local lazy = require("utils.plugins.lazy")

local M = {}

M.theme = {
	{
		"sainnhe/everforest",
		priority = 100,
	}
}

lazy.entry(M)

return M
