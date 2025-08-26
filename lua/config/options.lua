vim.g.have_nerd_font = true

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false
-- Make line numbers default
vim.o.number = true

-- Global default (optional)
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'LazyCheck',
  callback = function()
    require('lazy').update()
    require('lazy').show()
  end,
})

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Save undo history
vim.o.undofile = true

vim.o.relativenumber = true

vim.g.lazyvim_rust_diagnostics = 'rust-analyzer'

vim.opt.laststatus = 3
