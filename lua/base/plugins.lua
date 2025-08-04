local lazy = require("utils.plugins.lazy")

local M = {}

M.theme = {
  {
    "sainnhe/everforest",
    -- 优先级
    priority = 100,
  },
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
  {
    -- key binding map
    "folke/which-key.nvim",
    event = { "VeryLazy" },
  },
  {
    -- 大文件开启插件
    "LunarVim/bigfile.nvim",
    event = { "UIEnter" },
  },
}

M.views = {
  {
    -- launcher
    "goolord/alpha-nvim",
    event = { "VimEnter" },
  },
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
    -- session管理器
    "olimorris/persisted.nvim",
    event = { "VeryLazy" },
  },
  {
    -- 色值显示
    "norcalli/nvim-colorizer.lua",
    config = true,
    event = { "VeryLazy" },
  },
  {
    -- 单词舞蹈，乱玩的插件
    "eandrju/cellular-automaton.nvim",
    lazy = true,
  },
}

M.lsp = {
  {
    -- 语言服务包管理器
    "williamboman/mason.nvim",
    event = { "VimEnter" },
  },
  {
    -- LSP
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason-lspconfig.nvim" },
      { "Hoffs/omnisharp-extended-lsp.nvim" },
    },
  },
  {
    -- 代码格式化
    "mhartington/formatter.nvim",
    event = { "VeryLazy" },
  },
  {
    -- LSP进度插件
    "j-hui/fidget.nvim",
    -- tag = "legacy",
    event = { "LspAttach" },
  },
}

M.complete = {
  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      "xzbdmw/colorful-menu.nvim",
    },
    version = "1.*",
    event = { "InsertEnter", "CmdlineEnter" },
  },
  {
    -- 代码块
    "L3MON4D3/LuaSnip",
    -- in nvim-cmp config file require luasnip
    lazy = true,
    dependencies = {
      { "rafamadriz/friendly-snippets" },
    },
  },
  {
    'luozhiya/fittencode.nvim',
    event = { 'VeryLazy' },
  },
}

M.editor = {
  {
    -- 文件树
    "nvim-tree/nvim-tree.lua",
    event = { "VimEnter" },
  },
  {
    -- 缩进线
    "lukas-reineke/indent-blankline.nvim",
    event = { "VeryLazy" },
  },
  {
    -- 缩进线
    "echasnovski/mini.indentscope",
    name = "mini-indentscope",
    event = { "VeryLazy" },
  },
  {
    "echasnovski/mini.icons",
    version = false,
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
    -- 语法树
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      { "windwp/nvim-ts-autotag" },
    },
    event = { "UIEnter" },
  },
  {
    -- 搜索整合插件
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "kkharji/sqlite.lua",
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    lazy = true,
  },
  {
    -- 光标跳转(其实功能很多 =.= )
    "folke/flash.nvim",
    event = "VeryLazy",
  },
  {
    -- 注释插件
    "numToStr/Comment.nvim",
    dependencies = {
      { "JoosepAlviste/nvim-ts-context-commentstring" },
    },
    event = { "VeryLazy" },
  },
  {
    -- 成对符号快速操作
    "kylechui/nvim-surround",
    event = { "VeryLazy" },
  },
  {
    -- 代码签名生成
    "danymat/neogen",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter" },
    },
    config = true,
    lazy = true,
  },
  {
    -- 大纲插件
    "stevearc/aerial.nvim",
    event = { "VeryLazy" },
  },
  {
    -- 全局替换
    "nvim-pack/nvim-spectre",
    lazy = true,
  },
  {
    -- 增强复制
    "gbprod/yanky.nvim",
    event = { "VeryLazy" },
  },
  {
    -- 终端
    "akinsho/toggleterm.nvim",
    event = { "VeryLazy" },
  },
}

lazy.entry(M)

return M
