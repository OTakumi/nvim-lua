return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      panel = {
        enabled = true,
      },
      suggestion = {
        enabled = true,
      },
      copilot_node_command = "node",
      filetypes = {
        yaml = true,
        help = true,
        gitcommit = true,
        gitrebase = true,
        hgcommit = true,
        markdown = true,
        ["."] = false,
      },
    },
  },
}
