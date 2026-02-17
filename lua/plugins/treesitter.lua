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
      local select = require("nvim-treesitter-textobjects.select")
      local move = require("nvim-treesitter-textobjects.move")
      local swap = require("nvim-treesitter-textobjects.swap")

      require("nvim-treesitter-textobjects").setup({
        select = { lookahead = true },
        move = { set_jumps = true },
      })

      -- Select
      local sel = function(query) return function() select.select_textobject(query) end end
      vim.keymap.set({ "x", "o" }, "af", sel("@function.outer"), { desc = "outer function" })
      vim.keymap.set({ "x", "o" }, "if", sel("@function.inner"), { desc = "inner function" })
      vim.keymap.set({ "x", "o" }, "ac", sel("@class.outer"), { desc = "outer class" })
      vim.keymap.set({ "x", "o" }, "ic", sel("@class.inner"), { desc = "inner class" })
      vim.keymap.set({ "x", "o" }, "aa", sel("@parameter.outer"), { desc = "outer argument" })
      vim.keymap.set({ "x", "o" }, "ia", sel("@parameter.inner"), { desc = "inner argument" })

      -- Move
      vim.keymap.set({ "n", "x", "o" }, "]f", function() move.goto_next_start("@function.outer") end, { desc = "Next function start" })
      vim.keymap.set({ "n", "x", "o" }, "]c", function() move.goto_next_start("@class.outer") end, { desc = "Next class start" })
      vim.keymap.set({ "n", "x", "o" }, "]a", function() move.goto_next_start("@parameter.inner") end, { desc = "Next argument" })
      vim.keymap.set({ "n", "x", "o" }, "]F", function() move.goto_next_end("@function.outer") end, { desc = "Next function end" })
      vim.keymap.set({ "n", "x", "o" }, "]C", function() move.goto_next_end("@class.outer") end, { desc = "Next class end" })
      vim.keymap.set({ "n", "x", "o" }, "[f", function() move.goto_previous_start("@function.outer") end, { desc = "Previous function start" })
      vim.keymap.set({ "n", "x", "o" }, "[c", function() move.goto_previous_start("@class.outer") end, { desc = "Previous class start" })
      vim.keymap.set({ "n", "x", "o" }, "[a", function() move.goto_previous_start("@parameter.inner") end, { desc = "Previous argument" })
      vim.keymap.set({ "n", "x", "o" }, "[F", function() move.goto_previous_end("@function.outer") end, { desc = "Previous function end" })
      vim.keymap.set({ "n", "x", "o" }, "[C", function() move.goto_previous_end("@class.outer") end, { desc = "Previous class end" })

      -- Swap
      vim.keymap.set("n", "<leader>sa", function() swap.swap_next("@parameter.inner") end, { desc = "Swap with next argument" })
      vim.keymap.set("n", "<leader>sA", function() swap.swap_previous("@parameter.inner") end, { desc = "Swap with previous argument" })
    end,
  },
}
