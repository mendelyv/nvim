-- https://github.com/nvim-tree/nvim-tree.lua

local api = require("utils.api")
local public = require("utils.public")
local icons = public.get_icons_group("diagnostic", true)

local M = {
    requires = {
        "nvim-tree",
    },
}

function M.before()
    M.register_key()
end

function M.load()
    M.nvim_tree.setup({
        -- disable_netrw = false,
        -- hijack_netrw = false,
        -- hijack_cursor = true,
        -- update_cwd = true,
        -- ignore_ft_on_setup = { "dashboard" },
        -- reload_on_bufenter = true,
        -- notify = {
        --     threshold = vim.log.levels.WARN,
        -- },
        -- update_focused_file = {
        --     enable = true,
        --     update_cwd = false,
        -- },
        -- view = {
        --     number = true,
        --     relativenumber = true,
        --     side = "left",
        --     width = 30,
        --     hide_root_folder = false,
        --     signcolumn = "yes",
        --     mappings = {
        --         list = {
        --             { key = "?", action = "toggle_help" },
        --         },
        --     },
        -- },
        -- diagnostics = {
        --     enable = true,
        --     show_on_dirs = true,
        --     icons = {
        --         hint = icons.Hint,
        --         info = icons.Info,
        --         warning = icons.Warn,
        --         error = icons.Error,
        --     },
        -- },
        -- actions = {
        --     use_system_clipboard = true,
        --     change_dir = {
        --         enable = true,
        --         global = true,
        --         restrict_above_cwd = false,
        --     },
        --     open_file = {
        --         resize_window = true,
        --         window_picker = {
        --             enable = true,
        --         },
        --     },
        -- },
        -- trash = {
        --     cmd = "trash",
        --     require_confirm = true,
        -- },
        -- filters = {
        --     dotfiles = false,
        --     custom = { "node_modules", "\\.cache", "__pycache__" },
        --     exclude = {},
        -- },
        -- renderer = {
        --     add_trailing = true,
        --     highlight_git = true,
        --     highlight_opened_files = "none",
        --     icons = {
        --         show = {
        --             file = true,
        --             folder = true,
        --             folder_arrow = true,
        --             git = false,
        --         },
        --         glyphs = {
        --             default = "???",
        --             symlink = "???",
        --             git = {
        --                 unstaged = "???",
        --                 staged = "???",
        --                 unmerged = "???",
        --                 renamed = "???",
        --                 untracked = "???",
        --                 deleted = "???",
        --                 ignored = "???",
        --             },
        --             folder = {
        --                 arrow_open = "???",
        --                 arrow_closed = "???",
        --                 default = "???",
        --                 open = "???",
        --                 empty = "???",
        --                 empty_open = "???",
        --                 symlink = "???",
        --                 symlink_open = "???",
        --             },
        --         },
        --     },
        -- },
        -- ????????????
        -- auto_close = true,
        -- ??????
        view = {
            -- ??????
            width = 35,
            -- ??????
            -- height = 30,
            -- ??????????????????????????????
            hide_root_folder = false,
            -- ??????????????????
            -- auto_resize = true,
            side = "left",
            number = true,
            relativenumber = true,
        },
        diagnostics = {
            -- ??????????????????????????????
            enable = true,
            icons = {
                hint = " ",
                info = " ",
                warning = " ",
                error = "???",
            },
        },
        git = {
            -- ???????????? git ??????
            enable = false,
            ignore = false,
            timeout = 500,
        },
        filters = {
            -- ???????????????
            dotfiles = false,
            custom = {
                "*.meta",
                "*.DS_Store",
            },
        },
        actions = {
            use_system_clipboard = true,
            -- change_dir = {
            --     enable = true,
            --     global = true,
            --     restrict_above_cwd = false,
            -- },
            open_file = {
                resize_window = true,
                window_picker = {
                    enable = true,
                },
            },
        },
        update_focused_file = {
            enable = true,
            update_cwd = false,
        },
    })
end

function M.after() end

function M.register_key()
    api.map.bulk_register({
        {
            mode = { "n" },
            lhs = "<leader>1",
            rhs = function()
                local aerial_info = public.get_aerial_info()
                public.toggle_sidebar("NvimTree")
                require("nvim-tree.api").tree.toggle({ find_file = true, focus = true })
                public.reset_aerial_width(aerial_info)
            end,
            options = { silent = true },
            description = "Open File Explorer",
        },
    })
end

return M
