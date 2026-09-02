-- NOTE: this is the nvim-treesitter `main` branch (the rewrite). The old
-- `master`-branch options (highlight/auto_install/sync_install/ignore_install
-- passed to setup{}) are silently ignored here, which is why highlighting was
-- never actually starting -- you'd get legacy regex :syntax until a refresh.
-- On `main`, we install parsers and start highlighting ourselves per buffer.
-- (no compiler option on `main`: it shells out to the `tree-sitter` CLI, so the
-- old install.compilers setting was a silent no-op and has been dropped.)
require'nvim-treesitter'.install { "c", "lua", "vim", "vimdoc", "query", "python", "sql", "toml", "markdown", "yaml", "rust", "html", "hcl"}

-- Start treesitter highlighting + indentation for any filetype that has a
-- parser installed. vim.treesitter.start() errors when no parser exists, so we
-- pcall it and only wire up indentexpr on success.
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    if pcall(vim.treesitter.start, args.buf) then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
require('treesitter-context').setup{
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}
