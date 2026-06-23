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
      persist_size = true,
      on_open = function()
        vim.defer_fn(function()
          io.write("\x1b]12;#ff0000\x07")
        end, 10)
      end,
      on_close = function()
        vim.defer_fn(function()
          io.write("\x1b]12;#ff0000\x07")
        end, 10)
      end,
    }
  end,
}
