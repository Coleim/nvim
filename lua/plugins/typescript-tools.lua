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

        -- Auto organize imports and remove unused AFTER save, then save again
        local organizing = false
        vim.api.nvim_create_autocmd("BufWritePost", {
          buffer = bufnr,
          callback = function()
            if organizing then return end
            organizing = true
            vim.cmd("TSToolsRemoveUnused")
            vim.cmd("TSToolsOrganizeImports")
            vim.defer_fn(function()
              if vim.bo[bufnr].modified then
                vim.cmd("silent write")
              end
              organizing = false
            end, 200)
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
