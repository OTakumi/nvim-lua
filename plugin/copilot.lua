require("copilot").setup({
    panel = {
        enabled = false,
    },
    suggestion = {
        enabled = false,
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
    copilot_model = "claude-3.7-sonnet",
})
