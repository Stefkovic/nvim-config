return {
  "nickjvandyke/opencode.nvim",
  dependencies = { "folke/snacks.nvim" },
  keys = {
    { "<leader>aa", function() require("opencode").toggle() end, mode = { "n", "t" }, desc = "Toggle" },
    { "<leader>ap", function() require("opencode").ask("@this: ", { submit = true }) end, mode = { "n", "x" }, desc = "Ask with context" },
    { "<leader>as", function() require("opencode").select() end, mode = { "n", "x" }, desc = "Select action" },
    { "<leader>ao", function() return require("opencode").operator("@this ") end, mode = { "n", "x" }, desc = "Add range to prompt", expr = true },
  },
  config = function()
    vim.g.opencode_opts = {}
    vim.o.autoread = true
  end,
}
