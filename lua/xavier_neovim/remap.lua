-- set the leader key
vim.g.mapleader = " "

-- get back to the project directory
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- save with cnrl+s
vim.keymap.set("n", "<C-s>", ":w<CR>")

