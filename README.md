# Neovim Configuration

Personal Neovim configuration with LSP, formatting, and modern plugins.

## Prerequisites

### System Dependencies

```bash
# macOS (Homebrew)
brew install neovim git ripgrep fd wget

# Ubuntu/Debian
sudo apt install neovim git ripgrep fd-find wget
```

### Node.js & npm

Required for JS/TS tooling. Install via [nvm](https://github.com/nvm-sh/nvm) or your package manager:

```bash
# macOS
brew install node

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

## Installation

### 1. Clone this config

```bash
git clone https://github.com/YOUR_USERNAME/nvim ~/.config/nvim
```

### 2. Install formatters & linters

```bash
# Lua formatter
brew install stylua

# Prettier (for JS/TS/CSS/HTML/JSON)
npm install -g prettier prettierd

# TypeScript & ESLint
npm install -g typescript typescript-language-server eslint

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
| Rust | rust-analyzer | `rustup component add rust-analyzer` |

## Formatting Setup

All formatting is handled by **conform.nvim**:

| Filetype | Formatter |
|----------|----------|
| Lua | stylua |
| Rust | rustfmt |
| JS/TS/React | prettierd → prettier |
| CSS/SCSS | prettierd → prettier |
| HTML | prettierd → prettier |
| JSON | prettier |

## Keymaps

| Key | Action |
|-----|--------|
| `<leader>f` | Format buffer |
| `<leader>oi` | Organize imports (TS) |
| `<leader>ru` | Remove unused (TS) |
| `<leader>am` | Add missing imports (TS) |

## Verify Installation

Run these commands in Neovim to verify everything works:

```
:checkhealth
:ConformInfo
:Mason
:LspInfo
```

## Troubleshooting

### Formatter not found

```bash
# Check if prettier is installed
which prettier prettierd

# Reinstall if needed
npm install -g prettier prettierd
```

### LSP not starting

```bash
# Open Mason and install missing servers
:Mason
```
