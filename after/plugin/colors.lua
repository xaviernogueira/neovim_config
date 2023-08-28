require("tokyonight").setup({
  style = "night",
})
function ConfigTokyoNight(color)
	color = color or "tokyonight-night"
	vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, 'LineNr', { fg = 'white'})

end

ConfigTokyoNight()
