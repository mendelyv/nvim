-- https://github.com/L3MON4D3/LuaSnip
-- https://github.com/rafamadriz/friendly-snippets

local keymap = require("utils.keymap")
local path_util = require("utils.path")
local options = require("base.options")

local M = {
	requires = {
		"luasnip",
		"luasnip.loaders",
		"luasnip.loaders.from_vscode",
	}
}

function M.load()
    M.luasnip.setup({
        history = false,
        update_events = "TextChanged,TextChangedI",
        delete_check_events = "TextChanged",
    })

    M.luasnip_loaders_from_vscode.lazy_load({
        paths = {
            path_util.join(options.snippets_config_directory, "snippets"),
        },
    })
end

function M.after()
	M.register_keys()

	-- 在 nvim-cmp 中扩展 Luasnip 插件对 Vue 文件类型的支持，使得在 Vue 文件中可以使用 JavaScript 和 TypeScript 的代码片段
	M.luasnip.filetype_extend("vue", { "javascript", "typescript" })
end

function M.register_keys()
    keymap.register_all({
        {
            mode = { "i", "s" },
            lhs = "<tab>",
            rhs = function()
                return vim.api.nvim_eval("luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<tab>'")
            end,
            options = { silent = true, expr = true },
            description = "Jump to the next fragment placeholder",
        },
        {
            mode = { "i", "s" },
            lhs = "<s-tab>",
            rhs = function()
                return vim.api.nvim_eval("luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<s-tab>'")
            end,
            options = { silent = true, expr = true },
            description = "Jump to the prev fragment placeholder",
        },
    })
end

return M
