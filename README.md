# Neovim Configuration

Personal Neovim configuration with LSP, formatting, and modern plugins.

## Prerequisites

### System Dependencies

```bash
# macOS (Homebrew)
brew install neovim git ripgrep fd wget
brew install tree-sitter
brew install tree-sitter-cli
brew install glow   # markdown preview (glow.nvim)

# Ubuntu/Debian
sudo apt install neovim git ripgrep fd-find wget
```

### Node.js & npm

Required for JS/TS tooling. Install via [nvm](https://github.com/nvm-sh/nvm) or your package manager:

```bash
# macOS
brew install node

# If `node`/`npm` are installed but not found, link them (versioned node@NN formulae can unlink it):
brew link node

# Or via nvm (recommended)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
nvm install --lts
```

### Rust

Required for Rust development:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rust-analyzer
```

### Go

Required for Go development. Mason can install the editor tools, but you still need the Go toolchain:

```bash
# macOS
brew install go

# Optional manual install if you do not want Mason to manage Go tools
go install golang.org/x/tools/gopls@latest
go install golang.org/x/tools/cmd/goimports@latest
go install mvdan.cc/gofumpt@latest
```

## Installation

### 1. Clone this config

```bash
git clone https://github.com/Coleim/nvim.git ~/.config/nvim
```

### 2. Install formatters & linters

```bash
# Lua formatter
brew install stylua

# Prettier (for JS/TS/CSS/HTML/JSON)
npm install -g prettier @fsouza/prettierd

# TypeScript & ESLint
# NOTE: pin typescript to 5.x. TypeScript 7+ has no lib/tsserver.js, which
# typescript-tools.nvim requires ("Cannot find tsserver executable").
npm install -g typescript@5 typescript-language-server eslint

# Optional manual install for Go tools if you do not use Mason
go install golang.org/x/tools/gopls@latest
go install golang.org/x/tools/cmd/goimports@latest
go install mvdan.cc/gofumpt@latest

# Optional: Markdown linting
npm install -g markdownlint-cli
```

### 3. Launch Neovim

```bash
nvim
```

On first launch:
- **lazy.nvim** will auto-install all plugins
- **Mason** will install configured LSP servers (run `:Mason` to manage)

## LSP Servers

These are auto-installed via Mason or need manual installation:

| Language | Server | Installation |
|----------|--------|-------------|
| Lua | lua_ls | Auto (Mason) |
| TypeScript/JS | typescript-tools | Auto (Mason) |
| ESLint | eslint | Auto (Mason) |
| CSS | cssls | Auto (Mason) |
| Go | gopls | Auto (Mason, requires `go`) |
| Rust | rust-analyzer | `rustup component add rust-analyzer` |

## Formatting Setup

All formatting is handled by **conform.nvim**:

| Filetype | Formatter |
|----------|----------|
| Lua | stylua |
| Go | goimports -> gofumpt |
| Rust | rustfmt |
| JS/TS/React | prettierd → prettier |
| CSS/SCSS | prettierd → prettier |
| HTML | prettierd → prettier |
| JSON | prettier |

## Keymaps

### General

| Key | Mode | Action |
|-----|------|--------|
| `<leader>q` | Normal | Open diagnostic quickfix list |
| `<leader>ft` | Normal | Toggle floating terminal |
| `Ctrl+j` | Normal/Visual | Move line/selection down |
| `Ctrl+k` | Normal/Visual | Move line/selection up |
| `Shift+Tab` | Normal | Next buffer |
| `Esc Esc` | Terminal | Exit terminal insert mode and close window |
| `\` | Normal | Reveal current file in NeoTree |

### LSP

| Key | Mode | Action |
|-----|------|--------|
| `grn` | Normal | Rename symbol |
| `gra` | Normal/Visual | Code action |
| `grr` | Normal | Go to references |
| `gri` | Normal | Go to implementation |
| `grd` | Normal | Go to definition |
| `grD` | Normal | Go to declaration |
| `grt` | Normal | Go to type definition |
| `gO` | Normal | Document symbols |
| `gW` | Normal | Workspace symbols |
| `<leader>th` | Normal | Toggle inlay hints |

### TypeScript / JavaScript

| Key | Action |
|-----|--------|
| `<leader>f` | Format buffer |
| `<leader>oi` | Organize imports |
| `<leader>ru` | Remove unused imports |

### Search (Telescope)

| Key | Action |
|-----|--------|
| `<leader><leader>` | Find open buffers |
| `<leader>/` | Fuzzy search in current buffer |
| `<leader>sf` | Search files |
| `<leader>sg` | Search by grep (live) |
| `<leader>sw` | Search current word |
| `<leader>sd` | Search diagnostics |
| `<leader>sh` | Search help tags |
| `<leader>sk` | Search keymaps |
| `<leader>ss` | Search Telescope pickers |
| `<leader>sr` | Resume last search |
| `<leader>s.` | Search recent files |
| `<leader>s/` | Live grep in open files |
| `<leader>sn` | Search Neovim config files |

## Verify Installation

Run these commands in Neovim to verify everything works:

```
:checkhealth
:ConformInfo
:Mason
:LspInfo
```

## Troubleshooting

### Tree-sitter query error (e.g. `Invalid node type "change"` for diff)

Parsers and queries are out of sync. Update the parsers:

```bash
nvim --headless "+lua require('nvim-treesitter').update():wait(300000)" +qa
```

### Harmless `:checkhealth` warnings

Missing Java/PHP/Julia/Ruby/Perl/Python/Node providers, `vim.tbl_flatten`/`vim.validate`
deprecations (from plugins), and `blink_cmp_fuzzy lib is not downloaded` (the Lua
fuzzy implementation is used) can be ignored.

### Formatter not found

```bash
# Check if prettier is installed
which prettier prettierd

# Reinstall if needed
npm install -g prettier @fsouza/prettierd
```

### LSP not starting

```bash
# Open Mason and install missing servers
:Mason
```
