return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = {"nvim-tree/nvim-web-devicons"},
    lazy = false,
    keys = {{
        "<leader>o",
        function()
            local oil = require("oil")
            if vim.bo.filetype == "oil" then
                vim.cmd("bd")
            else
                oil.open()
            end
        end,
        desc = "Toggle Oil file explorer"
    }}
}
