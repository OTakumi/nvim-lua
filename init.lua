vim.loader.enable()

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy")
require("core/keymaps")
require("core/options")
require("core/colorscheme")

local filetype_conf = require("core/filetype")

vim.api.nvim_create_augroup("vimrc_augroup", {})
vim.api.nvim_create_autocmd("FileType", {
  group = "vimrc_augroup",
  pattern = "*",
  callback = function(args)
    filetype_conf[args.match]()
  end,
})
