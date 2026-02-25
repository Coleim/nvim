return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {
    expose_as_code_action = 'all',
    -- Disable formatting from typescript-tools to avoid conflicts with Prettier
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false

      -- Auto organize imports and remove unused on save (runs before Prettier)
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          local api = require("typescript-tools.api")
          api.organize_imports(true)   -- true = sync
          api.remove_unused(true)      -- true = sync
        end,
      })
    end,
  },
  keys = {
    { "<leader>oi", "<cmd>TSToolsOrganizeImports<cr>", desc = "Organize Imports" },
    { "<leader>ru", "<cmd>TSToolsRemoveUnused<cr>", desc = "Remove Unused" },
    { "<leader>am", "<cmd>TSToolsAddMissingImports<cr>", desc = "Add Missing Imports" },
  },
}
