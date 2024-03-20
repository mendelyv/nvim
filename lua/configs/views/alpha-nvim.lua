-- https://github.com/goolord/alpha-nvim

local M = {
  requires = {
    "alpha",
    "alpha.themes.dashboard",
  }
}

function M.load()
  M.alpha.setup(M.alpha_themes_dashboard.config)
end

return M
