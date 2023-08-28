-- relative and absolute line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- no wrapping
vim.opt.wrap = false

-- tabs set to 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- nice colors
vim.opt.termguicolors = true

-- fast update time
vim.opt.updatetime = 50

-- keep track of column 80
vim.opt.colorcolumn = "80"

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

