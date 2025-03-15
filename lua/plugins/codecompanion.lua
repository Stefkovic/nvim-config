return {
    "olimorris/codecompanion.nvim",
    dependencies = {"nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter"},
    cmd = {"CodeCompanion", "CodeCompanionActions", "CodeCompanionChat"},
    opts = {
        strategies = {
            chat = {
                adapter = "copilot"
            }
        }
    },
    keys = {{
        "<Leader>aa",
        "<cmd>CodeCompanionActions<cr>",
        mode = {"n", "v"},
        desc = "CodeCompanion: Show actions"
    }, {
        "<Leader>at",
        "<cmd>CodeCompanionChat Toggle<cr>",
        mode = {"n", "v"},
        desc = "CodeCompanion: Toggle chat"
    }, {
        "<Leader>as",
        "<cmd>CodeCompanionChat Add<cr>",
        mode = "v",
        desc = "CodeCompanion: Add selection to chat"
    }}
}
