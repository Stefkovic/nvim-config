return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()

      -- Enable treesitter highlighting
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("treesitter-highlight", { clear = true }),
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })

      -- Pre-install parsers
      local parsers = {
        "lua", "vim", "vimdoc", "markdown", "markdown_inline",
        "php", "html", "blade", "go", "gomod",
      }
      local installed = require("nvim-treesitter").get_installed()
      local missing = vim.tbl_filter(function(p)
        return not vim.tbl_contains(installed, p)
      end, parsers)
      if #missing > 0 then
        require("nvim-treesitter").install(missing)
      end
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = { query = "@function.outer", desc = "outer function" },
            ["if"] = { query = "@function.inner", desc = "inner function" },
            ["ac"] = { query = "@class.outer", desc = "outer class" },
            ["ic"] = { query = "@class.inner", desc = "inner class" },
            ["aa"] = { query = "@parameter.outer", desc = "outer argument" },
            ["ia"] = { query = "@parameter.inner", desc = "inner argument" },
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = { query = "@function.outer", desc = "Next function start" },
            ["]c"] = { query = "@class.outer", desc = "Next class start" },
            ["]a"] = { query = "@parameter.inner", desc = "Next argument" },
          },
          goto_next_end = {
            ["]F"] = { query = "@function.outer", desc = "Next function end" },
            ["]C"] = { query = "@class.outer", desc = "Next class end" },
          },
          goto_previous_start = {
            ["[f"] = { query = "@function.outer", desc = "Previous function start" },
            ["[c"] = { query = "@class.outer", desc = "Previous class start" },
            ["[a"] = { query = "@parameter.inner", desc = "Previous argument" },
          },
          goto_previous_end = {
            ["[F"] = { query = "@function.outer", desc = "Previous function end" },
            ["[C"] = { query = "@class.outer", desc = "Previous class end" },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>sa"] = { query = "@parameter.inner", desc = "Swap with next argument" },
          },
          swap_previous = {
            ["<leader>sA"] = { query = "@parameter.inner", desc = "Swap with previous argument" },
          },
        },
      })
    end,
  },
}
