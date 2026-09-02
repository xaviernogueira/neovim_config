-- set the leader key
vim.g.mapleader = " "
-- explicit localleader (this is the default); vimtex hangs its mappings off it
vim.g.maplocalleader = "\\"

-- get back to the project directory
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- save with cnrl+s
vim.keymap.set("n", "<C-s>", ":w<CR>")

-- make sure Esc is not remapped
vim.keymap.set("i", "<Esc>", "<Esc>", { noremap = true })
