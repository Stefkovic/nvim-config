return { -- Autoformat
    'stevearc/conform.nvim',
    event = {'BufWritePre'},
    cmd = {'ConformInfo'},
    keys = {{
        '<leader>F',
        function()
            require('conform').format {
                async = true,
                lsp_format = 'fallback'
            }
        end,
        mode = '',
        desc = '[F]ormat buffer'
    }},
    opts = {
        notify_on_error = false,
        formatters_by_ft = {
            lua = {'stylua'},
            go = {"goimports", "gofumpt"},
            php = {"php-cs-fixer"}
        }
    }
}
