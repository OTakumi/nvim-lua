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
      prompt = "Write commit message for the change with commitizen convention in Japanese. The title must be between 50 and 70 characters. The body should be a bulleted list with a maximum of 3 items, and each line must be under 100 characters. Format as a gitcommit code block.",
      context = "git:staged",
    },
  },
})
