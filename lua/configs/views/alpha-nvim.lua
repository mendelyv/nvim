-- https://github.com/goolord/alpha-nvim

local icons = require("utils.icons").get_icons("dashboard", true)

local M = {
  requires = {
    "alpha",
    "alpha.themes.dashboard",
  }
}

function M.load()
  local dashboard = M.alpha_themes_dashboard
  vim.api.nvim_set_hl(0, "DashboardLogo1", { fg = "#83C092" })
  dashboard.section.header.opts = { hl = "DashboardLogo1", position = "center" }
  dashboard.section.header.val = {
    [[                                                    ]],
    [[                                                    ]],
    [[                                                    ]],
    [[                                                    ]],
    [[                                                    ]],
    [[                                                    ]],
    [[                                                    ]],
    [[                                                    ]],
    [[                                                    ]],
    [[                                                    ]],
    [[                                                    ]],
    [[                                                    ]],
    [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
    [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
    [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
    [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
    [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
    [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
    [[                                                    ]],
    [[                                                    ]],
  }
  -- vim.api.nvim_set_hl(0, "NeovimDashboardLogo1", { fg = "#DA4939" })
  -- vim.api.nvim_set_hl(0, "NeovimDashboardLogo2", { fg = "#FF875F" })
  -- vim.api.nvim_set_hl(0, "NeovimDashboardLogo3", { fg = "#FFC66D" })
  -- vim.api.nvim_set_hl(0, "NeovimDashboardLogo4", { fg = "#00FF03" })
  -- vim.api.nvim_set_hl(0, "NeovimDashboardLogo5", { fg = "#00AFFF" })
  -- vim.api.nvim_set_hl(0, "NeovimDashboardLogo6", { fg = "#8800FF" })
  --
  -- dashboard.section.header.type = "group"
  -- dashboard.section.header.val = {
  --   { type = "text", val = "   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ", opts = { hl = "NeovimDashboardLogo1", shrink_margin = false, position = "center" } },
  --   { type = "text", val = "   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ", opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" } },
  --   { type = "text", val = "   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ", opts = { hl = "NeovimDashboardLogo3", shrink_margin = false, position = "center" } },
  --   { type = "text", val = "   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ", opts = { hl = "NeovimDashboardLogo4", shrink_margin = false, position = "center" } },
  --   { type = "text", val = "   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ", opts = { hl = "NeovimDashboardLogo5", shrink_margin = false, position = "center" } },
  --   { type = "text", val = "   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ", opts = { hl = "NeovimDashboardLogo6", shrink_margin = false, position = "center" } },
  -- }

  dashboard.section.buttons.val = {
    dashboard.button("b", " " .. icons.Session .. "> Restore session", "<cmd>silent! SessionLoad<CR>"),
    dashboard.button("f", " " .. icons.Find .. "> Find File", "<cmd>silent lua require(\"telescope.builtin\").find_files({ hidden = true })<CR>"),
    dashboard.button("n", " " .. icons.NewFile .. "> New File", ":ene <BAR> startinsert <CR>"),
    dashboard.button("p", " " .. icons.Lazy .. "> Lazy", ":Lazy<CR>"),
    dashboard.button("q", " " .. icons.Quit .. "> Quit Neovim", ":qa<CR>"),
  }

  -- local fortune = require("alpha.fortune")
  -- dashboard.section.footer.val = fortune()
  -- dashboard.section.footer.opts.hl = '@alpha.footer'

  -- dashboard.section.footer.val = {
  --   [[                      ]],
  --   [[                      ]],
  --   [[                      ]],
  --   [[                      ]],
  --   [[                      ]],
  --   [[                      ]],
  --   [[    Something for Nothing    ]],
  --   [[                      ]],
  --   [[                      ]],
  --   [[                      ]],
  --   [[                      ]],
  --   [[                      ]],
  -- }

  M.alpha.setup(dashboard.config)

  vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
end

return M
