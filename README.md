# neovim_config

## TODO:
- [ ] Stick with it as is and see what we should add as we go.

## Includes
* [`packer.nvim`](https://github.com/wbthomason/packer.nvim): For plugin managment.
* [`telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim): For fuzzy finding.
* [`tokyonight.nvim`](https://github.com/folke/tokyonight.nvim): Colorscheme, set to "night".
* [`harpoon`](https://github.com/ThePrimeagen/harpoon): For quick file access.
* [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter): For syntax highlighting and LSP. Requires the `tree-sitter` CLI and a C compiler in PATH.
* [`nvim-treesitter-context`](https://github.com/nvim-treesitter/nvim-treesitter-context): Allows scrolling with context.
* [`vim-fugitive`](https://github.com/tpope/vim-fugitive): Allows git to be accessed via `:G ...`.
* [`lsp-zero`](https://github.com/VonHeikemen/lsp-zero.nvim): Pre-set config for an LSP, I ensured the install of [`ty`](https://github.com/astral-sh/ty) as the Python LSP.
* [`venv-selector`](https://github.com/linux-cultist/venv-selector.nvim) for Python virtual environment selection.
* [`vim-python-pep8-indent`](https://github.com/Vimjas/vim-python-pep8-indent): Fixes python auto-indenting via PEP8 standards.
* [`vimtex`](https://github.com/lervag/vimtex): LaTeX compilation, PDF forward search and editing motions.
* [`luasnip-latex-snippets.nvim`](https://github.com/iurimateus/luasnip-latex-snippets.nvim): Autofiring maths snippets for LaTeX.
* [`cmp-vimtex`](https://github.com/micangl/cmp-vimtex): Completion source for `\cite{}` and `\ref{}`.
* [`img-clip.nvim`](https://github.com/HakonHarnes/img-clip.nvim): Pastes clipboard images straight into a figure environment.
* [`nabla.nvim`](https://github.com/jbyuki/nabla.nvim): Renders the equation under the cursor as ascii art.

## Leader keys
* `<leader>` = Space bar.
* `<localleader>` = `\` (used by every VimTeX mapping).

## General
| Key | Action |
| --- | --- |
| `<leader>pv` | Return to file tree. |
| `cntrl+s` | Write current file (`:w` alias). |
| `<leader>vs` | Browse/select a Python virtual environment. |
| `<leader>g` | Open fugitive's git status window. |

## Finding files
| Key | Action |
| --- | --- |
| `<leader>pf` | Fuzzy find all project files. |
| `cntrl+p` | Fuzzy find only git tracked files. |
| `<leader>ps` | Searches files for a word (requires [`ripgrep`](https://github.com/BurntSushi/ripgrep)). |
| `<leader>h` | Toggles harpoon menu. |
| `<leader>a` | Harpoons the current file. |
| `<leader>1,2,3,4` | Harpoon slot hot keys. |

## LSP over buffer remaps
| Key | Action |
| --- | --- |
| `cntrl+]` | Next completion item. |
| `cntrl+[` | Previous completion item. |
| `cntrl+=` | Confirm item. |
| `cntrl+Space` | Trigger completion. |
| `K` | Show hover info. |
| `cntrl+h` | Show variable signature (insert mode). |
| `gd` | Go to definition. |
| `<leader>vrn` | Rename variable. |
| `<leader>vca` | Trigger code action. |
| `<leader>vrr` | List references. |
| `<leader>vws` | Search workspace symbols. |
| `<leader>vd` | Show diagnostic in a float. |
| `]d` | Jump to next diagnostic. |
| `[d` | Jump to previous diagnostic. |
| `<leader>r` | Restart the LSP server (`:LspRestart`). |

## LaTeX
Compilation and viewing, all prefixed with `<localleader>l`:

| Key | Action |
| --- | --- |
| `\ll` | Start/stop latexmk in continuous mode (rebuilds on every save). |
| `\lS` | Single-shot compile instead of the watcher. |
| `\lv` | Forward search: jump to the cursor's position in zathura. |
| `\lr` | Reverse search back from the PDF. |
| `\lk` | Stop the compiler (`\lK` stops all of them). |
| `\le` | Open the error/quickfix list. |
| `\lo` | Show the raw compiler output. |
| `\lq` | Open the full latexmk log. |
| `\lc` | Clean aux files (`\lC` also removes the PDF). |
| `\lt` | Open a table of contents (`\lT` toggles it). |
| `\lg` | Show compiler status. |
| `\li` | Show what VimTeX knows about this project. |
| `\lm` | List the maths imaps that are available. |

Editing, from VimTeX unless noted:

| Key | Action |
| --- | --- |
| `dse` / `cse` | Delete / change the surrounding environment. |
| `tse` | Toggle the environment between its two forms. |
| `tss` | Toggle the environment's starred variant. |
| `ds$` / `cs$` | Delete / change the surrounding maths zone. |
| `ts$` | Toggle between inline `$ $` and display `\[ \]`. |
| `dsc` / `csc` | Delete / change the surrounding command. |
| `tsc` | Toggle the command's starred variant. |
| `tsf` | Toggle a fraction between `\frac{}{}` and `a/b`. |
| `dsd` / `csd` | Delete / change the surrounding delimiter. |
| `tsd` | Toggle delimiter modifiers (`(` vs `\left( \right)`). |
| `]]` `[[` `][` `[]` | Jump between sections. |
| `%` | Jump between matching delimiters, environments and `\if` blocks. |
| `ic` / `ac` | Text object for the current command. |
| `id` / `ad` | Text object for the current delimiter. |
| `i$` / `a$` | Text object for the current maths zone. |
| `<F7>` | Create a command from the word under the cursor. |
| `<leader>ip` | Paste a clipboard image into a figure environment (`img-clip`). |
| `<localleader>n` | Preview the equation under the cursor as ascii art (`nabla`). |

Two different systems fill in maths for you:

* **Snippets** (`luasnip-latex-snippets`) fire as you type inside a maths zone, with
  no trigger key: `//` becomes `\frac{}{}`, `sr` becomes `^2`, `td` becomes `^{}`,
  `sq` becomes `\sqrt{}`, `bmat` becomes a matrix environment.
* **VimTeX imaps** are insert-mode maps behind a backtick: `` `a `` becomes `\alpha`,
  `` `8 `` becomes `\infty`, `` `2 `` becomes `\sqrt`. There are 75 of them; `\lm`
  lists the lot.

## Config notes
* for `venv-selector` one needs to add paths to venv locations in `after/venv.lua`. See [here](https://github.com/linux-cultist/venv-selector.nvim)
* LaTeX needs a TeX distribution and a viewer outside of neovim. On Fedora: `sudo dnf install texlive-scheme-medium latexmk zathura zathura-pdf-mupdf`. The bare `texlive-base` set is *not* enough; it lacks `amsmath` and the Type1 typewriter fonts, so compilation fails on font generation.
* `texlab` and `ltex-ls` are installed through mason. VimTeX owns compiling, so texlab's own build is disabled to stop the two of them fighting over aux files. `ltex-ls` is a java server and takes a few seconds to start on the first tex or markdown buffer.
* **To set this up on a fresh machine:** start by running `lua/xavier_neovim/set.lua` -> `lua/xavier_neovim/remap.lua` -> `lua/xavier_neovim/packer.lua` -> `lua/xavier_neovim/init.lua`
