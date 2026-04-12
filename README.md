# Neovim Configuration

Personal Neovim configuration using [lazy.nvim](https://github.com/folke/lazy.nvim).

## Requirements

- Neovim (latest stable recommended)
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)
- For Rust: `rustup component add rust-analyzer` (do **not** use Mason — see `lua/plugins/rust.lua`)

## Directory Structure

```text
.
├── init.lua
├── after/
│   ├── ftplugin/    # Filetype-specific indentation settings
│   └── lsp/         # Per-server LSP configuration overrides
└── lua/
    ├── config/      # lazy.nvim bootstrap
    ├── core/        # Options, colorscheme, LSP keymaps
    ├── lsp/         # Global LSP capabilities and enabled servers
    └── plugins/     # Plugin configurations — see lua/plugins/README.md
```

## LSP Configuration

To add a new LSP server, add it to `ensure_installed` in `lua/plugins/lsp.lua`.

For custom server settings, create `after/lsp/<server-name>.lua`:

```lua
return {
  settings = {
    your_server = { ... },
  },
}
```
