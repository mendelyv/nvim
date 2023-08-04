-- https://github.com/simrat39/symbols-outline.nvim

local keymap = require('utils.keymap')
local icons = require('utils.icons').get_icons('lsp_kind', false)

local M = {
	requires = {
		"symbols-outline",
	}
}

function M.before()
	vim.print('symbols_outline before')
end

function M.load()
	M.symbols_outline.setup({
		width = 40,
		show_numbers = true,
		show_relative_numbers = true,
		auto_close = true,
		autofold_depth = 2,
		auto_preview = true,
		symbols = {
			File = { icon = icons.File, hl = "@text.uri" },
			Module = { icon = icons.Module, hl = "@namespace" },
			Namespace = { icon = icons.Namespace, hl = "@namespace" },
			Package = { icon = icons.Package, hl = "@namespace" },
			Class = { icon = icons.Class, hl = "@type" },
			Method = { icon = icons.Method, hl = "@method" },
			Property = { icon = icons.Property, hl = "@method" },
			Field = { icon = icons.Field, hl = "@field" },
			Constructor = { icon = icons.Constructor, hl = "@constructor" },
			Enum = { icon = icons.Enum, hl = "@type" },
			Interface = { icon = icons.Interface, hl = "@type" },
			Function = { icon = icons.Function, hl = "@function" },
			Variable = { icon = icons.Variable, hl = "@constant" },
			Constant = { icon = icons.Constant, hl = "@constant" },
			String = { icon = icons.String, hl = "@string" },
			Number = { icon = icons.Number, hl = "@number" },
			Boolean = { icon = icons.Boolean, hl = "@boolean" },
			Array = { icon = icons.Array, hl = "@constant" },
			Object = { icon = icons.Object, hl = "@type" },
			Key = { icon = icons.Key, hl = "@type" },
			Null = { icon = icons.Null, hl = "@type" },
			EnumMember = { icon = icons.EnumMember, hl = "@field" },
			Struct = { icon = icons.Struct, hl = "@type" },
			Event = { icon = icons.Event, hl = "@type" },
			Operator = { icon = icons.Operator, hl = "@operator" },
			TypeParameter = { icon = icons.TypeParameter, hl = "@parameter" },
		}
	})
end

function M.after()
	M.register_keys()
end

function M.register_keys()
	keymap.register_all({
		{
			mode = { "n" },
			lhs = "<leader>2",
			rhs = "<cmd>SymbolsOutline<cr>",
			options = { silent = true },
			description = "Open Outline Explorer",
		},
	})
end

return M
