return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  config = function()
    require("typescript-tools").setup({
      expose_as_code_action = "all",
      on_attach = function(client, bufnr)
        -- Disable formatting from typescript-tools to avoid conflicts with Prettier
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false

        -- Auto organize imports and remove unused on save
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            vim.cmd("TSToolsOrganizeImports sync")
            vim.cmd("TSToolsRemoveUnused sync")
          end,
        })
      end,
    })
  end,
  keys = {
    { "<leader>oi", "<cmd>TSToolsOrganizeImports<cr>", desc = "Organize Imports" },
    { "<leader>ru", "<cmd>TSToolsRemoveUnused<cr>", desc = "Remove Unused" },
  },
}
