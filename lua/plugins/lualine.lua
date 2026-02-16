return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    return {
      options = {
        theme = "catppuccin",
        globalstatus = true,
        component_separators = "",
        section_separators = {
          left = "",
          right = ""
        }
      },
      sections = {
        lualine_a = { {
          "mode",
          separator = {
            left = ""
          },
          right_padding = 2
        } },
        lualine_b = { "filename", "branch" },
        lualine_c = { "%=" },
        lualine_x = { {
          function()
            local ok, status = pcall(require, "opencode.status")
            if ok then return status.statusline() end
            return ""
          end,
          cond = function()
            local ok, status = pcall(require, "opencode.status")
            return ok and status.status ~= nil
          end,
          color = function()
            local ok, status = pcall(require, "opencode.status")
            if not ok then return end
            if status.status == "error" then return "DiagnosticError" end
            if status.status == "responding" then return "DiagnosticWarn" end
            if status.status == "requesting_permission" then return "DiagnosticInfo" end
            return "Special"
          end,
        }, {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates
        }, "lsp_status" },
        lualine_y = { "filetype", "progress" },
        lualine_z = { {
          function() return os.date("%a %b %d %H:%M") end,
          separator = {
            right = ""
          },
          left_padding = 2
        } }
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" }
      }
    }
  end
}
