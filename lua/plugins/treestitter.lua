return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline',
      'query', 'vim', 'vimdoc', 'javascript', 'typescript', 'tsx', 'css', 'json',
      'yaml', 'toml', 'rust',
    },
  },
  config = function(_, opts)
    require('nvim-treesitter').setup(opts)

    -- Install missing parsers immediately
    require('nvim-treesitter.install').install(opts.ensure_installed, { summary = false })

    vim.api.nvim_create_autocmd({ 'FileType', 'BufEnter' }, {
      pattern = { 'typescriptreact', 'javascriptreact', 'typescript', 'javascript' },
      callback = function(ev)
        pcall(vim.treesitter.start, ev.buf)
      end,
    })
  end,
}
