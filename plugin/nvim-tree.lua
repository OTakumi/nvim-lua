-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
    },
    renderer = {
        group_empty = true,
        highlight_git = true,
        highlight_opened_files = "name",
        icons = {
            glyphs = {
                git = {
                    unstaged = "!",
                    renamed = "»",
                    untracked = "?",
                    deleted = "✘",
                    staged = "✓",
                    unmerged = "",
                    ignored = "◌",
                },
            },
        },
    },
    filters = {
        dotfiles = false,
    },
    git = {
        ignore = false,
    },
})

vim.api.nvim_create_user_command("Ex", function()
    vim.cmd.NvimTreeToggle()
end, {})
