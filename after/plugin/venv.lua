require("venv-selector").setup(
    { 
        anaconda_envs_path = "C:/Users/xrnogueira/Miniconda3/envs", 
        anaconda = { python_parent_dir = '' },
        pipenv_path = "C:/Users/xrnogueira/.virtualenvs"
    }
)

vim.keymap.set("n", "<leader>vs", ":VenvSelect<CR>")
