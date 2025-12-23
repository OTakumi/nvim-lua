return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" }, -- lazyplugings.lua.old の branch="master" を追加
    },
    build = "make tiktoken",
    opts = {
      -- lazyplugings.lua.old からの window 設定
      window = {
        layout = "float",
        width = 120,
        height = 40,
        border = "rounded",
        title = "🤖 AI Assistant",
        zindex = 100,
      },
      -- lazyplugings.lua.old からの headers 設定
      headers = {
        user = "👤 You",
        assistant = "🤖 Copilot",
        tool = "🔧 Tool",
      },
      -- 既存の panel 設定
      panel = {
        enabled = true,
        auto_refresh = true,
        position = "right",
        width = 50,
        height = 20,
      },
      -- 既存の chat 設定
      chat = {
        enabled = true,
        auto_refresh = true,
        position = "bottom",
        width = 50,
        height = 20,
      },
      -- 既存の prompts.Commit 設定
      prompts = {
        Commit = {
          prompt = "Write commit message for the change with commitizen convention in Japanese. The title must be between 50 and 70 characters. The body should be a bulleted list with a maximum of 3 items, and each line must be under 100 characters. Format as a gitcommit code block.",
          context = "git:staged",
        },
      },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")
      chat.setup(opts)

      -- lazyplugings.lua.old からの gitcommit autocmd 設定
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "gitcommit",
        callback = function()
          vim.schedule(function()
            vim.cmd("CopilotChatCommit")
          end)
        end,
      })
    end,
  },
}

