local use_master = vim.env.NVIM_TS_MASTER == '1'

local ensure_installed = {
  'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline',
  'query', 'vim', 'vimdoc', 'javascript', 'typescript', 'tsx', 'css', 'json',
  'yaml', 'toml', 'rust', 'go',
}

if use_master then
  return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = ensure_installed,
        auto_install = true,
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })
    end,
  }
else
  return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = ensure_installed,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    },
    config = function(_, opts)
      require('nvim-treesitter').setup(opts)

      -- Install missing parsers immediately
      require('nvim-treesitter.install').install(opts.ensure_installed, { summary = false })

      vim.api.nvim_create_autocmd({ 'FileType', 'BufEnter' }, {
        pattern = { 'typescriptreact', 'javascriptreact', 'typescript', 'javascript', 'go' },
        callback = function(ev)
          pcall(vim.treesitter.start, ev.buf)
        end,
      })
    end,
  }
end
