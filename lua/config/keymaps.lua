vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Close terminal with <Esc><Esc>
vim.keymap.set('t', '<Esc><Esc>', function()
  -- First exit terminal insert mode
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-\\><C-n>', true, false, true), 'n', true)
  -- Then close the terminal buffer/window
  vim.cmd 'close' -- or vim.cmd("hide")
end, { desc = 'Exit and close terminal' })

-- In terminal mode, make <Space> immediately send a space
-- vim.keymap.set('t', '<Space>', '<Space>', { noremap = true, silent = true })

-- Manual Neo-tree git refresh
-- vim.api.nvim_create_user_command('NeoTreeGitRefresh', function()
--   if package.loaded['neo-tree.sources.git_status'] then
--     require('neo-tree.sources.git_status').refresh()
--   end
-- end, { desc = 'Refresh Neo-tree git status' })

-- vim.keymap.set('n', '<leader>r', ':NeoTreeGitRefresh<CR>', { desc = 'Refresh Neo-tree Git status' })

vim.api.nvim_set_keymap('n', '<leader>ft', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true })
