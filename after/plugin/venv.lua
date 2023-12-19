require("venv-selector").setup()
--    { 
--        anaconda_envs_path = "~/miniconda3/envs", 
--        anaconda = { python_parent_dir = '' },
--    }
--)

vim.keymap.set("n", "<leader>vs", ":VenvSelect<CR>")
