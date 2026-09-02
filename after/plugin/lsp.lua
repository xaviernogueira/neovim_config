local lsp = require("lsp-zero")
lsp.preset("recommended")

-- register ty as our custom python LSP. lsp-zero v1 drives the old lspconfig
-- "framework" (require('lspconfig').<server>.setup), which doesn't ship a ty
-- config yet, so we register one here. NOTE: the server is started with
-- `ty server` -- passing a `stdio` arg makes ty exit with an error.
local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')

if not configs.ty then
  configs.ty = {
    default_config = {
      cmd = {'ty', 'server'},
      filetypes = {'python'},
      root_dir = lspconfig.util.root_pattern('ty.toml', 'pyproject.toml', 'setup.py', 'setup.cfg', '.git'),
      single_file_support = true,
      settings = {},
    },
  }
end

lsp.ensure_installed({
    'ty',
    'lua_ls',
    'sqlls',
    'yamlls',
    'jsonls',
    'rust_analyzer',
    'texlab',
    'ltex',
})

-- texlab handles the *language* side of LaTeX (diagnostics, symbols, renaming a
-- label everywhere). VimTeX owns compiling and viewing, so texlab's own build is
-- turned off -- otherwise both of them drive latexmk and fight over the aux
-- files. chktex is installed, so let texlab lint with it.
lsp.configure('texlab', {
    settings = {
        texlab = {
            build = { onSave = false },
            chktex = { onOpenAndSave = true, onEdit = false },
            forwardSearch = {
                executable = 'zathura',
                args = { '--synctex-forward', '%l:1:%f', '%p' },
            },
        },
    },
})

-- ltex-ls is grammar/spell checking that understands LaTeX markup, so it flags
-- prose mistakes without tripping over \begin{} and friends. NOTE: it is a java
-- server and takes a few seconds to start on the first tex/markdown buffer.
lsp.configure('ltex', {
    settings = {
        ltex = {
            language = 'en-US',
            additionalRules = { enablePickyRules = false },
        },
    },
})

-- fix undefined global vim (stolen from ThePrimeagen
lsp.nvim_workspace()

-- setup code completion window
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-[>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-]>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-=>'] = cmp.mapping.confirm({ select = true}),
  ['<C-Space>'] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

-- set some preferences
lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I',
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>r", function() vim.cmd("LspRestart") end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

end)

lsp.setup()
vim.diagnostic.config({
    virtual_text = true,
})

