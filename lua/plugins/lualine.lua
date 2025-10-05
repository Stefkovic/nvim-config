return {
    "nvim-lualine/lualine.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},
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
                lualine_a = {{
                    "mode",
                    separator = {
                        left = ""
                    },
                    right_padding = 2
                }},
                lualine_b = {"filename", "branch"},
                lualine_c = {"%="},
                lualine_x = {{
                    function() return " " end,
                    color = function()
                        local status = require("sidekick.status").get()
                        if status then
                            return status.kind == "Error" and "DiagnosticError" or status.busy and "DiagnosticWarn" or
                                       "Special"
                        end
                    end,
                    cond = function()
                        local ok, status = pcall(require, "sidekick.status")
                        return ok and status.get() ~= nil
                    end
                }, {
                    require("lazy.status").updates,
                    cond = require("lazy.status").has_updates
                }, "lsp_status"},
                lualine_y = {"filetype", "progress"},
                lualine_z = {{
                    function() return os.date("%a %b %d %H:%M") end,
                    separator = {
                        right = ""
                    },
                    left_padding = 2
                }}
            },
            inactive_sections = {
                lualine_a = {"filename"},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {"location"}
            }
        }
    end
}
