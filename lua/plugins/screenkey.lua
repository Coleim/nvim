return {
  "NStefan002/screenkey.nvim",
  lazy = false,
  version = "*", -- or branch = "main", to use the latest commit
  config = function()
    require("screenkey").setup({
      keys = {
        ["<TAB>"]      = "⇥",
        ["<CR>"]       = "⏎",
        ["<ESC>"]      = "Esc",
        ["<SPACE>"]    = "␣",
        ["<BS>"]       = "⌫",
        ["<DEL>"]      = "Del",
        ["<LEFT>"]     = "←",
        ["<RIGHT>"]    = "→",
        ["<UP>"]       = "↑",
        ["<DOWN>"]     = "↓",
        ["<HOME>"]     = "Home",
        ["<END>"]      = "End",
        ["<PAGEUP>"]   = "PgUp",
        ["<PAGEDOWN>"] = "PgDn",
        ["<INSERT>"]   = "Ins",
        -- Function keys
        ["<F1>"]       = "F1",
        ["<F2>"]       = "F2",
        ["<F3>"]       = "F3",
        ["<F4>"]       = "F4",
        ["<F5>"]       = "F5",
        ["<F6>"]       = "F6",
        ["<F7>"]       = "F7",
        ["<F8>"]       = "F8",
        ["<F9>"]       = "F9",
        ["<F10>"]      = "F10",
        ["<F11>"]      = "F11",
        ["<F12>"]      = "F12",
        -- Modifiers
        ["CTRL"]       = "Ctrl",
        ["ALT"]        = "Alt",
        -- ["SHIFT"]      = "⇧",
        ["SUPER"]      = "<>", -- Windows / Command key

        ["<leader>"]   = "<leader>",
      }
    })

    -- Auto-enable on start
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        require("screenkey").toggle()
      end,
    })
  end,
}
