-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- rapid file switching
    use {
        'nvim-telescope/telescope.nvim', tag = 'v0.2.2',
        -- bumped from 0.1.2: 0.2.x previewer supports the nvim-treesitter
        -- `main` rewrite (uses vim.treesitter.start); 0.1.2 called the
        -- removed ft_to_lang() API and threw in the previewer.
        -- NOTE: the `v` prefix is required. telescope tagged bare through
        -- 0.1.8 and v-prefixed from v0.1.9 on, so a plain '0.2.2' is not a
        -- resolvable revision and packer's checkout fails.
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use { "theprimeagen/harpoon" }

    -- colorscheme
    use {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = { style = "night"},
    }

    -- treesitter for syntax highlighting
    -- NOTE: on the `main` branch, install.update() is an async task object, not
    -- a callable returned by update({with_sync=true}) like it was on `master`.
    -- The old hook threw "attempt to call a table value" on every PackerSync;
    -- :TSUpdate drives the async task properly.
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }

    -- allows for better scrolling
    use { "nvim-treesitter/nvim-treesitter-context" }

    use { "tpope/vim-fugitive" }

    -- LSP feastures
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    -- switch virtual environments without restarting
    use {
        "linux-cultist/venv-selector.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "mfussenegger/nvim-dap-python",
        },
    }
    -- to fix python indenting to be pep8
    use { "Vimjas/vim-python-pep8-indent" }

    -- LaTeX editing: compilation, forward/inverse search, motions
    use { "lervag/vimtex" }

    -- Castel-style math snippets (// -> \frac, sr -> ^2). needs autosnippets
    -- turned on in LuaSnip, which vimtex.lua does.
    use {
        "iurimateus/luasnip-latex-snippets.nvim",
        requires = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
    }

    -- cmp source that completes \cite{} from the .bib and \ref{} from real labels
    use { "micangl/cmp-vimtex" }

    -- paste an image from the clipboard straight into a figure environment
    use { "HakonHarnes/img-clip.nvim" }

    -- render an equation as ascii art without compiling
    use { "jbyuki/nabla.nvim" }
end)
