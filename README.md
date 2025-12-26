# Neovim Configuration

## Directory Structure

The main directory structure of this Neovim configuration:

```text
.
├── init.lua          # Main Neovim configuration file
├── after/
│   ├── ftplugin/     # Filetype-specific indentation settings (highest priority)
│   │   ├── python.lua
│   │   ├── lua.lua
│   │   ├── typescript.lua
│   │   └── ...
│   └── lsp/          # Custom configuration files for each LSP server
│       ├── pylsp.lua
│       ├── vtsls.lua
│       └── vue_ls.lua
└── lua/              # Main Lua modules
    ├── config/       # lazy.nvim configuration
    ├── core/         # Core settings (options, colorscheme, LSP keymaps)
    │   ├── options.lua
    │   ├── colorscheme.lua
    │   └── lsp-keymaps.lua
    ├── lsp/          # LSP-related (currently only init.lua)
    │   └── init.lua
    └── plugins/      # Plugin configurations (30+ plugins)
```

## LSP Configuration

Steps to add a new LSP server:

1. Open the `lua/plugins/lsp.lua` file.
2. Add the name of the LSP server you want to add to the `ensure_installed` list (use the name displayed in `mason`).

    ```lua
    opts = {
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "your_new_server", -- Add here
      },
      automatic_install = true,
    },
    ```

    * This will automatically install and enable the server when Neovim starts.
3. (Optional) To add custom settings for a server, create a configuration file in the `after/lsp/` directory.
    * Create a file named `after/lsp/<server-name>.lua`, and the settings will be automatically loaded and merged with the defaults when the server starts.
    * For example, to add custom settings for `pylsp`, create `after/lsp/pylsp.lua` and `return` the configuration as a Lua table.

<https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file>

### Configuration Example: `after/lsp/pylsp.lua`

```lua
return {
  settings = {
    pylsp = {
      plugins = {
        -- Your plugins here
      },
    },
  },
}
```
