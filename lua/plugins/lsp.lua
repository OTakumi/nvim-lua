return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "clangd",
        "cmake",
        "csharp_ls",
        "gopls",
        "vue_ls",
        "vtsls",
        "pylsp",
        "ruff",
        "dockerls",
      },
    },
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "mason-org/mason-registry",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local mason_root = vim.env.MASON or (vim.fn.stdpath("data") .. "/mason")
      local vue_language_server_path = mason_root
        .. "/packages/vue-language-server/node_modules/@vue/language-server/node_modules"

      require("mason-lspconfig").setup({
        handlers = {
          -- Default handler
          function(server_name)
            lspconfig[server_name].setup({ capabilities = capabilities })
          end,

          ---------- C ----------
          ["clangd"] = function()
            lspconfig.clangd.setup({
              capabilities = capabilities,
              cmd = { "clangd" },
              filetypes = { "c", "cpp" },
            })
          end,
          ---------- C# ----------
          ["csharp_ls"] = function()
            lspconfig.csharp_ls.setup({
              capabilities = capabilities,
              cmd = { "csharp-ls" },
              filetypes = { "cs" },
              init_options = {
                AutomaticWorkspaceInit = true,
              },
            })
          end,
          ---------- Docker ----------
          ["dockerls"] = function()
            lspconfig.dockerls.setup({
              capabilities = capabilities,
              cmd = { "docker-language-server", "--stdio" },
              filetypes = { "dockerfile", "yaml.docker-compose" },
              root_dir = lspconfig.util.root_pattern(
                "Dockerfile",
                "docker-compose.yaml",
                "docker-compose.yml",
                "compose.yaml",
                "compose.yml",
                "docker-bake.json",
                "docker-bake.hcl",
                "docker-bake.override.json",
                "docker-bake.override.hcl"
              ),
            })
          end,
          ---------- Go ----------
          ["gopls"] = function()
            lspconfig.gopls.setup({
              capabilities = capabilities,
              cmd = { "gopls" },
              filetypes = { "go", "gomod", "gowork", "gotmpl" },
            })
          end,
          ---------- Lua ----------
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              cmd = { "lua-language-server" },
              filetypes = { "lua" },
              settings = {
                Lua = {
                  workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                  },
                },
              },
              on_attach = function(client, bufnr)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
              end,
            })
          end,
          ---------- CMake ----------
          ["cmake"] = function()
            lspconfig.neocmakelsp.setup({
              capabilities = capabilities,
              cmd = { "neocmakelsp", "--stdio" },
              filetypes = { "cmake" },
            })
          end,
          ---------- Python ----------
          ["pylsp"] = function()
            lspconfig.pylsp.setup({
              capabilities = capabilities,
              cmd = { "pylsp" },
              filetypes = { "python" },
              root_dir = lspconfig.util.root_pattern(
                "pyproject.toml",
                "setup.py",
                "setup.cfg",
                "requirements.txt",
                "Pipfile",
                ".git"
              ),
              settings = {
                pylsp = {
                  plugins = {
                    pycodestyle = {
                      ignore = { "W391" },
                      maxLineLength = 120,
                    },
                  },
                },
              },
            })
          end,
          ["ruff"] = function()
            lspconfig.ruff.setup({
              capabilities = capabilities,
              cmd = { "ruff", "server" },
              filetypes = { "python" },
              root_dir = lspconfig.util.root_pattern("pyproject.toml", "ruff.toml", ".ruff.toml", ".git"),
              init_options = {
                settings = {
                  args = {},
                },
              },
            })
          end,

          ---------- TypeScript/JavaScript ----------
          ["vue_ls"] = function()
            lspconfig.vue_ls.setup({
              capabilities = capabilities,
              filetypes = { "vue" },
              init_options = {
                vue = {
                  hybridMode = true,
                },
              },
            })
          end,
          -- Vue + TypeScript
          ["vtsls"] = function()
            lspconfig.vtsls.setup({
              capabilities = capabilities,
              root_dir = lspconfig.util.root_pattern(
                "tsconfig.app.json",
                "tsconfig.json",
                "tsconfig.node.json",
                ".git"
              ),
              filetypes = {
                "typescript",
                "javascript",
                "typescriptresct",
                "javascriptreact",
                "vue",
              },
              settings = {
                vtsls = {
                  tsserver = {
                    globalPlugins = {
                      {
                        name = "/@vue/typescript-plugin",
                        location = vue_language_server_path,
                        languages = { "vue" },
                        configNamespace = "typescript",
                      },
                    },
                  },
                },
              },
              on_attach = function(client, bufnr)
                -- Vueファイルではセマンティックトークンをvue_lsに任せる
                if vim.bo[bufnr].filetype == "vue" then
                  client.server_capabilities.semanticTokensProvider = nil
                end
              end,
            })
          end,
          ["biome"] = function()
            lspconfig.biome.setup({
              capabilities = capabilities,
              root_dir = lspconfig.util.root_pattern("biome.json", "biome.jsonc"),
            })
          end,
        },
      })
    end,
  },
}
