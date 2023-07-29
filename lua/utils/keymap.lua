-- 按键映射工具模块
local M = {}

-- vim.api.nvim_set_keymap 和 vim.keymap.set 是 Neovim 中用于设置键盘映射的两个函数，它们在功能上是相同的，都可以用于动态地在 Lua 脚本中设置键盘映射。
-- 注册按键映射
function M.register(map)
    map.options.desc = map.description

    if type(map.rhs) == "function" or map.options.buffer then
        vim.keymap.set(
            map.mode,
            map.lhs,
            map.rhs,
            map.options
        )
        return
    end

    for _, mode in ipairs(map.mode) do
	-- mode：表示映射的模式，可以是以下之一：
		-- "n": 正常模式 (Normal mode)
		-- "v": 可视模式 (Visual mode)
		-- "s": 选择模式 (Select mode)
		-- "x": 可视块模式 (Visual-block mode)
		-- "i": 插入模式 (Insert mode)
		-- "c": 命令行模式 (Command-line mode)
		-- "t": 终端模式 (Terminal mode)
	-- lhs：表示映射的按键序列，即按键组合，例如 "j" 或 <C-l>。
	-- rhs：表示映射后的结果，即按下 lhs 后会触发的操作，可以是一个命令、函数或键盘操作。
	-- opts：一个可选的选项表，用于设置映射的其他选项，例如是否递归、是否静默执行等。
        vim.api.nvim_set_keymap(
            mode,
            map.lhs,
            map.rhs,
            map.options
        )
    end
end

-- 注销按键映射
function M.unregister(mode, lhs, opts)
    vim.keymap.del(mode, lhs, opts)
end

-- 批量注册按键映射
function M.registerAll(maps)
    for _, map in pairs(maps) do
        M.register(map)
    end
end

return M
