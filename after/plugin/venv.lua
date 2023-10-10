require("venv-selector").setup(
    { 
        anaconda_envs_path = "C:/Users/xrnogueira/Miniconda3/envs", 
        anaconda = { python_parent_dir = '' },
    }
)

vim.keymap.set("n", "<leader>vs", ":VenvSelect<CR>")
