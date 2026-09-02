-- VimTeX is a vimscript plugin, so it has no setup() function to call: every
-- option is a global variable named `g:vimtex_*` (`vim.g.vimtex_*` from lua).
-- VimTeX reads them lazily, when it initialises a tex buffer, so setting them
-- here in after/plugin is early enough -- this file is sourced during startup,
-- before filetype detection fires for any file you opened on the command line.

-- treat a bare `.tex` file as LaTeX instead of plaintex. this is a vim option,
-- not a vimtex one, but vimtex only attaches to the `tex` filetype.
vim.g.tex_flavor = 'latex'

-- vimtex's mappings all hang off <localleader>, which is unset (so it is `\`)
-- unless remap.lua says otherwise: \ll starts compilation, \lv jumps to the
-- PDF, \lk stops it, \lc clears aux files, \li shows plugin info.

-- forward search: which viewer :VimtexView talks to
vim.g.vimtex_view_method = 'zathura'

-- latexmk is the default compiler. keep the aux/output clutter in build/ so it
-- doesn't sit next to the source. vimtex tells the viewer where the pdf went.
vim.g.vimtex_compiler_latexmk = {
    aux_dir = 'build',
    out_dir = 'build',
}

-- the quickfix window is useful for errors, but latex warns constantly
-- (overfull hboxes, undefined refs on the first pass) -- don't let warnings
-- alone steal the window.
vim.g.vimtex_quickfix_open_on_warning = 0

-- vimtex ships its own syntax highlighting for tex and it is what provides
-- math-zone awareness and conceal. do NOT install the treesitter `latex`
-- parser: treesitter.lua starts highlighting for any filetype that has one,
-- and the two highlighters would fight. if you ever do want treesitter here,
-- set vim.g.vimtex_syntax_enabled = 0 at the same time.

-- vimtex can conceal `\alpha` as α, \frac as a division, etc, but only when
-- 'conceallevel' allows it. enable it just for tex buffers.
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'tex',
    callback = function()
        vim.opt_local.conceallevel = 2
    end,
})

-- ---------------------------------------------------------------------------
-- the rest of the latex toolchain
-- ---------------------------------------------------------------------------

-- luasnip-latex-snippets is autosnippet-driven: the snippets fire as you type
-- rather than on a trigger key, so this flag is not optional. it also detects
-- whether the cursor is in a maths zone using vimtex's syntax (not treesitter),
-- which is why we left vimtex's own highlighting in place.
local ok_luasnip, luasnip = pcall(require, 'luasnip')
if ok_luasnip then
    luasnip.config.setup({ enable_autosnippets = true })
    local ok_snips, latex_snips = pcall(require, 'luasnip-latex-snippets')
    if ok_snips then
        latex_snips.setup()
    end
end

-- completion sources for tex buffers specifically: cmp-vimtex reads the .bib
-- and the document's labels, which nvim_lsp alone cannot offer.
local ok_cmp, cmp = pcall(require, 'cmp')
if ok_cmp then
    cmp.setup.filetype('tex', {
        sources = cmp.config.sources({
            { name = 'vimtex' },
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
        }, {
            { name = 'buffer' },
            { name = 'path' },
        }),
    })
end

-- <leader>ip pastes whatever image is on the clipboard into figures/ next to
-- the document and writes the figure environment around it. wl-copy is present,
-- so this works under wayland.
local ok_img, img_clip = pcall(require, 'img-clip')
if ok_img then
    img_clip.setup({
        default = {
            dir_path = 'figures',
            relative_to_current_file = true,
            prompt_for_file_name = true,
        },
        filetypes = {
            tex = {
                template = table.concat({
                    '\\begin{figure}[h]',
                    '  \\centering',
                    '  \\includegraphics[width=0.8\\textwidth]{$FILE_PATH}',
                    '  \\caption{$CURSOR}',
                    '  \\label{fig:$LABEL}',
                    '\\end{figure}',
                }, '\n'),
            },
        },
    })
    vim.keymap.set('n', '<leader>ip', '<cmd>PasteImage<cr>', { desc = 'paste image into document' })
end

-- <localleader>n renders the equation under the cursor as ascii art in a float,
-- which is quicker than a full rebuild when you just want to check a fraction.
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'tex',
    callback = function(args)
        local ok_nabla, nabla = pcall(require, 'nabla')
        if ok_nabla then
            vim.keymap.set('n', '<localleader>n', nabla.popup,
                { buffer = args.buf, desc = 'preview equation under cursor' })
        end
    end,
})
