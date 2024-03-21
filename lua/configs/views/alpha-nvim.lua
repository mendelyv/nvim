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

  dashboard.section.buttons.val = {
    dashboard.button("b", " " .. icons.Session .. "> Restore session", "<cmd>silent! SessionLoad<CR>"),
    dashboard.button("f", " " .. icons.Find .. "> Find File", ":Telescope find_files<CR>"),
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
