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
    {
        "akinsho/bufferline.nvim",
        event = { "UIEnter" },
    },
    {
	    -- session管理器
        "olimorris/persisted.nvim",
        event = { "VeryLazy" },
    },
}

M.lsp = {
	{
		-- 语言服务管理器
		"williamboman/mason.nvim",
		event = { "VimEnter" },
	},
	    {
		    -- LSP
		"neovim/nvim-lspconfig",
		dependencies = {
		    { "williamboman/mason-lspconfig.nvim" },
		},
	    },
}

M.editor = {
	{
		-- 文件树
		"nvim-tree/nvim-tree.lua",
	},
	{
		-- 缩进线
		"lukas-reineke/indent-blankline.nvim",
		event = { "UIEnter" },
	},
    {
	    -- 光标文本高亮
        "RRethy/vim-illuminate",
        event = { "UIEnter" },
    },
    {
	    -- 括号自动补全
        "windwp/nvim-autopairs",
	config = true,
        event = { "InsertEnter" },
    },
}

lazy.entry(M)

return M
