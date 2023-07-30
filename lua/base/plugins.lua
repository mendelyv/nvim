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
	{
		-- LSP美化工具
		"tami5/lspsaga.nvim",
		event = { "UIEnter" },
	},
	{
		-- 面包屑导航
		"SmiteshP/nvim-navic",
		lazy = true,
	},
    {
	    -- LSP进度插件
        "j-hui/fidget.nvim",
	tag = "legacy",
        event = { "UIEnter" },
    },
}

M.complete = {
	{
		-- 补全插件及其相关的源
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "kristijanhusak/vim-dadbod-completion" },
		},
		event = { "InsertEnter", "CmdlineEnter" },
	},
	{
		"L3MON4D3/LuaSnip",
		-- in nvim-cmp config file require luasnip
		lazy = true,
		dependencies = {
			{ "rafamadriz/friendly-snippets" },
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
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            { "mrjones2014/nvim-ts-rainbow" },
            { "windwp/nvim-ts-autotag" },
            { "JoosepAlviste/nvim-ts-context-commentstring" },
        },
        event = { "UIEnter" },
    },
}

lazy.entry(M)

return M
