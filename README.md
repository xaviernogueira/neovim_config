# neovim_config

## TODO:
- [ ] Add a LSP for Python.
- [ ] Add fugitive for Git.

## Includes
* [`packer.nvim`](https://github.com/wbthomason/packer.nvim): For plugin managment.
* [`telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim): For fuzzy finding.
* [`tokyonight.nvim`](https://github.com/folke/tokyonight.nvim): Colorscheme, set to "night".
* [`copilot.vim`](https://github.com/github/copilot.vim): Github copilot -> requires subscription.
* [harpoon](https://github.com/ThePrimeagen/harpoon): For quick file access.
* [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter): For syntax highlighting and LSP. Requires C compiler in PATH.
* [`nvim-treesitter-context`](https://github.com/nvim-treesitter/nvim-treesitter-context): Allows scrolling with context.


## Remaps
* `<leader>` = Space bar.
* `<leader>pv` = Return to file tree.
* `<leader>pf` = Fuzzy find all project files.
* `<leader>ps` = Search project files.
* `<cntrl+p>` = Fuzzy find only git tracked files.
* `<leader>ps` = Searches files for a word (requires [`ripgrep`](https://github.com/BurntSushi/ripgrep)).
* `<leader>h` = Toggles harpoon menu.
* `<leader>a` = Harpoons the current file.
