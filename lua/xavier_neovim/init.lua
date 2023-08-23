require("xavier_neovim.remap")
require("tokyonight").setup({
  style = "night",
})
vim.wo.relativenumber = true
vim.api.nvim_set_hl(0, 'LineNr', { fg = 'white'})

require 'nvim-treesitter.install'.compilers = { "gcc" }
