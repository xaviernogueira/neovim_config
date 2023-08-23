-- relative and absolute line numbers
vim.opt.nu = true
vim.opt.relativenumber = true
vim.api.nvim_set_hl(0, 'LineNr', { fg = 'white'})

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

