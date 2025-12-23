local cwd = vim.fn.getcwd()
require("venv-selector").setup(
    {
        anaconda_envs_path = cwd .. "./pixi/envs",
        anaconda = { python_parent_dir = "bin" },
    }
)

vim.keymap.set("n", "<leader>vs", ":VenvSelect<CR>")
