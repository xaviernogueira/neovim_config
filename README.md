# neovim_config

## TODO:
- [ ] Add an LSP for Python.
- [ ] Get [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) for syntax highlighting. This requires having a C compiler in PATH.
- [ ] Get [harpoon](https://github.com/ThePrimeagen/harpoon)

## Includes
* [`packer.nvim`](https://github.com/wbthomason/packer.nvim): For plugin managment.
* [`telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim): For fuzzy finding.
* [`tokyonight.nvim`](https://github.com/folke/tokyonight.nvim): Colorscheme, set to "night".
* [`copilot.vim`](https://github.com/github/copilot.vim): Github copilot -> requires subscription.

## Remaps
* `<leader>` = Space bar.
* `<leader>pv` = Return to file tree.
* `<leader>pf` = Fuzzy find all project files.
* `<leader>ps` = Search project files.
* `<cntrl+p>` = Fuzzy find only git tracked files.
* `<leader>ps` = Searches files for a word (requires [`ripgrep`](https://github.com/BurntSushi/ripgrep)).
