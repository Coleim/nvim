return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  config = function()
    local ts_tools = require 'typescript-tools'

    ts_tools.setup {
      settings = {
        separate_diagnostic_server = true,
        publish_diagnostic_on = 'insert_leave',
        expose_as_code_action = 'all',
      },
    }

    -- Conform setup
    local conform = require 'conform'
    conform.setup {
      formatters_by_ft = {
        javascript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
      },
    }

    -- Autoformat on save
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = { '*.js', '*.jsx', '*.ts', '*.tsx' },
      callback = function()
        conform.format { async = false }
      end,
    })
  end,
}
