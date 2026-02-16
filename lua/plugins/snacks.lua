return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    input = {},
    picker = {},
    terminal = {},
    dashboard = {
      preset = {
        keys = {
          { icon = "󰈞 ", key = "f", desc = "Find File", action = function() require("fzf-lua").files() end },
          { icon = "󰊄 ", key = "g", desc = "Live Grep", action = function() require("fzf-lua").live_grep() end },
          { icon = "󰋚 ", key = "o", desc = "Recent Files", action = function() require("fzf-lua").oldfiles() end },
          { icon = "󰦛 ", key = "s", desc = "Restore Session", action = function() require("persistence").load() end },
          { icon = "󰒓 ", key = "v", desc = "Neovim Config", action = function() require("fzf-lua").files({ cwd = vim.fn.stdpath("config") }) end },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = "󰈆 ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "projects", limit = 5, padding = 1 },
        function()
          local stats = require("lazy").stats()
          local updates = stats.updates or 0
          if updates > 0 then
            return {
              { text = "󰏗 " .. updates .. " plugin update" .. (updates > 1 and "s" or "") .. " available", align = "center", padding = 1 },
            }
          end
          return {}
        end,
        { section = "startup" },
      },
    },
  },
}
