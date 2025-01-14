vim.loader.enable()

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("lazy/lazy")
require("core/keymaps")
require("core/options")
require("core/colorscheme")

vim.api.nvim_create_augroup("vimrc_augroup", {})

vim.treesitter.start = (function(wrapped)
    return function(bufnr, lang)
        lang = lang or vim.fn.getbufvar(bufnr or "", "&filetype")
        pcall(wrapped, bufnr, lang)
    end
end)(vim.treesitter.start)
