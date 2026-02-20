return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = { {
    "<leader>ff",
    "<cmd>FzfLua files<cr>",
    desc = "Find Files"
  }, {
    "<leader>fg",
    "<cmd>FzfLua live_grep<cr>",
    desc = "Live Grep"
  }, {
    "<leader>fb",
    "<cmd>FzfLua buffers<cr>",
    desc = "Buffers"
  }, {
    "<leader>fh",
    "<cmd>FzfLua help_tags<cr>",
    desc = "Help Tags"
  }, {
    "<leader>fr",
    "<cmd>FzfLua resume<cr>",
    desc = "Resume"
  }, {
    "<leader>fo",
    "<cmd>FzfLua oldfiles<cr>",
    desc = "Recent Files"
  }, {
    "<leader>fc",
    "<cmd>FzfLua commands<cr>",
    desc = "Commands"
  }, {
    "<leader>fs",
    "<cmd>FzfLua lsp_document_symbols<cr>",
    desc = "Document Symbols"
  }, {
    "<leader>fd",
    "<cmd>FzfLua diagnostics_document<cr>",
    desc = "Document Diagnostics"
  }, {
    "<leader>fD",
    "<cmd>FzfLua diagnostics_workspace<cr>",
    desc = "Workspace Diagnostics"
  }, {
    "<leader>fv",
    function() require("fzf-lua").files({ cwd = vim.fn.stdpath("config") }) end,
    desc = "Neovim Config"
  }, {
    "<leader>gl",
    "<cmd>FzfLua git_commits<cr>",
    desc = "Log"
  }, {
    "<leader>gL",
    "<cmd>FzfLua git_bcommits<cr>",
    desc = "Log (buffer)"
  }, {
    "<leader>gS",
    "<cmd>FzfLua git_status<cr>",
    desc = "Status"
  }, {
    "<leader>la",
    function()
      local fzf = require("fzf-lua")
      local use_ddev = vim.fn.executable("ddev") == 1 and vim.fs.root(0, { ".ddev" })
      local cmd = use_ddev and "ddev artisan" or "php artisan"
      fzf.fzf_exec(cmd .. " list --raw --no-ansi 2>/dev/null | awk '{print $1}'", {
        prompt = "Artisan> ",
        actions = {
          ["default"] = function(selected)
            vim.ui.input({ prompt = "artisan " .. selected[1] .. " " }, function(args)
              if args then
                vim.cmd("botright split | terminal " .. cmd .. " " .. selected[1] .. " " .. args)
              else
                vim.cmd("botright split | terminal " .. cmd .. " " .. selected[1])
              end
            end)
          end,
        },
      })
    end,
    desc = "Artisan"
  } },
  opts = {
    fzf_opts = {
      ["--layout"] = "default"
    },
    files = {
      fd_opts = "--hidden --follow --exclude .git"
    },
    grep = {
      rg_opts = "--column --line-number --no-heading --color=always --smart-case"
    }
  },
  config = function(_, opts)
    require("fzf-lua").setup(opts)
    require("fzf-lua").register_ui_select()
  end

}
