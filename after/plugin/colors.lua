require("tokyonight").setup({
  style = "night",
})
function ConfigTokyoNight(color)
	color = color or "tokyonight-night"
	vim.cmd.colorscheme(color)
end

ConfigTokyoNight()
