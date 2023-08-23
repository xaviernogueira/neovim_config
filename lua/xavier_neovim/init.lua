require("xavier_neovim.remap")
require("xavier_neovim.set")
require("tokyonight").setup({
  style = "night",
})
require 'nvim-treesitter.install'.compilers = { "gcc" }
