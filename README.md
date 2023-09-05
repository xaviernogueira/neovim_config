# neovim_config

## TODO:
- [ ] Stick with it as is and see what we should add as we go.

## Includes
* [`packer.nvim`](https://github.com/wbthomason/packer.nvim): For plugin managment.
* [`telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim): For fuzzy finding.
* [`tokyonight.nvim`](https://github.com/folke/tokyonight.nvim): Colorscheme, set to "night".
* [`copilot.vim`](https://github.com/github/copilot.vim): Github copilot -> requires subscription.
* [harpoon](https://github.com/ThePrimeagen/harpoon): For quick file access.
* [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter): For syntax highlighting and LSP. Requires C compiler in PATH.
* [`nvim-treesitter-context`](https://github.com/nvim-treesitter/nvim-treesitter-context): Allows scrolling with context.
* [`vim-fugitive`](https://github.com/tpope/vim-fugitive): Allows git to be accessed via `:G ...`.
* [`lsp-zero`](https://github.com/VonHeikemen/lsp-zero.nvim): Pre-set config for an LSP, I ensured the install of [`pyright`](https://microsoft.github.io/pyright/#/).
* [`venv-selector`](https://github.com/linux-cultist/venv-selector.nvim) for Python virtual environment selection.

## General Normal Mode Remaps
* `<leader>` = Space bar.
* `<leader>pv` = Return to file tree.
* `<leader>pf` = Fuzzy find all project files.
* `cntrl+p` = Fuzzy find only git tracked files.
* `<leader>ps` = Searches files for a word (requires [`ripgrep`](https://github.com/BurntSushi/ripgrep)).
* `<leader>h` = Toggles harpoon menu.
* `<leader>a` = Harpoons the current file.
* `<leader>1,2,3,4` = Harpoon slot hot keys.
* `cntrl+s` = Write current file (`:w` alias).
* `<leader>vs` = Browse/select a Python virtual environment.

## LSP over buffer remans
* `cntrl+]` = Next item.
* `cntrl+[` = Previous item.
* `cntrl+=` = Confirm item.
* `cntrl+Space` = Autocomplete with confirmed item.
* `K` = Show hover info.
* `cntrl+h` = Show variable signature.
* `<leader>vrn` = Rename variable.

## Config notes
* for `venv-selector` one needs to add paths to venv locations in `after/venv.lua`. See [here](https://github.com/linux-cultist/venv-selector.nvim)
