vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd("set shortmess+=I")

require("config.lazy")
require("config.options")
require("config.keymaps")
