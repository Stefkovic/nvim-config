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
