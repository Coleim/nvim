return {
  'akinsho/toggleterm.nvim',
  lazy = false,
  config = function()
    require('toggleterm').setup {
      size = 10,
      direction = 'float',
      float_opts = {
        border = 'curved',
        width = math.floor(vim.o.columns * 0.8),
        height = math.floor(vim.o.lines * 0.8),
      },
      -- open_mapping = [[<leader>ft]],
      persist_size = true,
    }
  end,
}
