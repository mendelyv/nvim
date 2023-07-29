local path_util = require("utils.path")

local M = {}

local M = {
	debug = false,

	-- 插件存放路径
	-- Linux下一般在$HOME/.local/share/nvim/${yourpath}
	-- windows下一般在$HOME/AppData/nvim-data/${yourpath}
	storage_directory = path_util.join(vim.fn.stdpath("data"), "store"),
	-- 悬浮窗
	float_border = true,
	-- 透明
	transparent = true,
}

return M
