# Neovim Config

Personal Neovim configuration with LSP, fuzzy finding, Git integration, and AI assistance.

## Features

- **Plugin management** — lazy.nvim (auto-bootstraps on first launch)
- **LSP** — Lua, Go, PHP with manual `vim.lsp.start()` setup
- **Completion** — blink.cmp
- **Fuzzy finder** — fzf-lua (files, grep, buffers, symbols, diagnostics)
- **Formatting** — conform.nvim (stylua, gofumpt, goimports, pint, prettierd)
- **Git** — gitsigns + lazygit
- **Treesitter** — highlighting, text objects, movement
- **AI** — OpenCode integration
- **File manager** — yazi
- **Theme** — Catppuccin Mocha

## Structure

```
init.lua
lua/
  config/
    options.lua     Settings (indent, search, UI)
    lazy.lua        Plugin manager bootstrap
    autocmds.lua    Auto-commands (format on save, yank highlight)
    keymaps.lua     Global keymaps
    lsp.lua         LSP attach, keymaps, auto-start
  lsp/
    lua.lua         lua-language-server config
    go.lua          gopls config
    php.lua         intelephense config
  plugins/
    mason.lua       Tool installer (LSP servers, formatters)
    treesitter.lua  Syntax highlighting, text objects, movement
    blink-cmp.lua   Completion
    conform.lua     Formatting
    fzf.lua         Fuzzy finder
    gitsigns.lua    Git hunks
    snacks.lua      Dashboard, picker, indent, lazygit
    catppuccin.lua  Color scheme
    lualine.lua     Status line
    which-key.lua   Keymap hints
    mini.lua        Pairs, surround, ai text objects
    yazi.lua        File manager
    opencode.lua    AI assistant
    persistence.lua Session management
    todo-comments.lua  TODO highlighting
```

## Dependencies

- **Mason (auto-installed):** lua-language-server, gopls, intelephense, stylua, gofumpt, goimports, prettierd, prettier, pint
- **Brew:** fzf, fd, ripgrep, git, lazygit, yazi

## Keybindings

Leader key: `Space`

### Find

| Key | Action |
|-----|--------|
| `Space ff` | Find Files |
| `Space fg` | Live Grep |
| `Space fb` | Buffers |
| `Space fh` | Help Tags |
| `Space fr` | Resume last search |
| `Space fo` | Recent Files |
| `Space fc` | Commands |
| `Space fs` | Document Symbols |
| `Space fd` | Document Diagnostics |
| `Space fD` | Workspace Diagnostics |
| `Space fv` | Neovim Config files |
| `Space ft` | Todo Comments |

### LSP / Code

| Key | Action |
|-----|--------|
| `gd` | Go to Definition |
| `gr` | Go to References |
| `gD` | Go to Declaration |
| `gi` | Go to Implementation |
| `gt` | Type Definition |
| `K` | Hover Documentation |
| `[d` / `]d` | Prev / Next Diagnostic |
| `Space e` | Show Diagnostic |
| `Space cf` | Format Buffer |
| `Space ca` | Code Action |
| `Space rs` | Rename Symbol |
| `Space rn` | Rename File |
| `Space q` | Diagnostics to Loclist |
| `Space ws` | Workspace Symbols |

### Git

| Key | Action |
|-----|--------|
| `Space gg` | Lazygit |
| `Space gl` | Git Log |
| `Space gL` | Git Log (buffer) |
| `Space gS` | Git Status |
| `Space gs` | Stage Hunk |
| `Space gr` | Reset Hunk |
| `Space gu` | Undo Stage Hunk |
| `Space gp` | Preview Hunk |
| `Space gb` | Blame Line |
| `Space gd` | Diff This |
| `[h` / `]h` | Prev / Next Hunk |

### Treesitter Text Objects

Use with operators (`d`, `y`, `c`, `v`):

| Key | Action |
|-----|--------|
| `af` / `if` | Outer / Inner function |
| `ac` / `ic` | Outer / Inner class |
| `aa` / `ia` | Outer / Inner argument |

### Treesitter Movement

| Key | Action |
|-----|--------|
| `]f` / `[f` | Next / Prev function start |
| `]F` / `[F` | Next / Prev function end |
| `]c` / `[c` | Next / Prev class start |
| `]a` / `[a` | Next / Prev argument |
| `]t` / `[t` | Next / Prev TODO |

### Surround

| Key | Action |
|-----|--------|
| `sa{motion}{char}` | Add surround (e.g. `saiw"`) |
| `sd{char}` | Delete surround (e.g. `sd"`) |
| `sr{old}{new}` | Replace surround (e.g. `sr"'`) |

### AI

| Key | Action |
|-----|--------|
| `Space aa` | Toggle AI assistant |
| `Space ap` | Ask with context |
| `Space as` | Select action |

### Session

| Key | Action |
|-----|--------|
| `Space qs` | Restore Session |
| `Space ql` | Restore Last Session |
| `Space qd` | Don't Save Session |

### Other

| Key | Action |
|-----|--------|
| `Space y` | Yazi file manager |
| `Space la` | Artisan (Laravel) |
| `Space sa` / `Space sA` | Swap next / prev argument |
| `Space ?` | Show buffer keymaps |

A printable cheat sheet is available at [cheatsheet.html](cheatsheet.html).
