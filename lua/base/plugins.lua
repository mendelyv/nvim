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
		-- lua工具包
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
		-- 图标
		"nvim-tree/nvim-web-devicons",
		event = { "VimEnter" },
	},
	{
		-- 状态栏
		"nvim-lualine/lualine.nvim",
		config = true,
		event = { "UIEnter" },
	},
}

M.lsp = {
	{
		-- 语言服务管理器
		"williamboman/mason.nvim",
		event = { "VimEnter" },
	},
	    {
		"neovim/nvim-lspconfig",
		dependencies = {
		    { "williamboman/mason-lspconfig.nvim" },
		},
	    },
}

lazy.entry(M)

return M
