return {
    "folke/sidekick.nvim",
    opts = {
        cli = {
            mux = {
                backend = "tmux",
                enabled = false
            }
        }
    },
    keys = {{
        "<leader>aa",
        function() require("sidekick.cli").toggle() end,
        desc = "Sidekick Toggle CLI"
    }, {
        "<leader>av",
        function()
            require("sidekick.cli").send({
                msg = "{selection}"
            })
        end,
        mode = {"x"},
        desc = "Send Visual Selection"
    }}
}
