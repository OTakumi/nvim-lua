require("CopilotChat").setup({
  panel = {
    enabled = true,
    auto_refresh = true,
    position = "right",
    width = 50,
    height = 20,
  },
  chat = {
    enabled = true,
    auto_refresh = true,
    position = "bottom",
    width = 50,
    height = 20,
  },
  prompts = {
    Commit = {
      prompt = "Write commit message for the change with commitizen convention in Japanese. Keep the title under 50 characters and wrap message at 72 characters. Format as a gitcommit code block. ",
      context = "git:staged",
    },
  },
})
