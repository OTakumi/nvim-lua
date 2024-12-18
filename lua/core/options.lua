local options = {
    encoding = "utf-8",
    fileencoding = "utf-8",
    title = true,
    backup = false,
    autoindent = true,
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    colorcolumn = "80",
    termguicolors = true,
    number = true,
    list = true,
    ignorecase = true,
    smartcase = true,
    wrapscan = true,
    hlsearch = true,
    incsearch = true,
    inccommand = "split",
    cursorcolumn = true,
    signcolumn = "yes",
    expandtab = true,
}

vim.opt.shortmess:append("c")
for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.opt.listchars = {
    space = "_",
    tab = ">-",
}

vim.opt.clipboard:append({ "unnamedplus" })
