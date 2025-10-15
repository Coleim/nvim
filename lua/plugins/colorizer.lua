return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      filetypes = {
        "typescript",
        "typescriptreact",
        "*" },           -- enable for all files
      user_default_options = {
        RGB = true,      -- #RGB hex codes
        RRGGBB = true,   -- #RRGGBB hex codes
        names = true,    -- "Blue" etc
        RRGGBBAA = true, -- #RRGGBBAA
        rgb_fn = true,   -- CSS rgb() and rgba()
        hsl_fn = true,   -- CSS hsl() and hsla()
        css = true,      -- Enable all CSS features
        css_fn = true,   -- Enable all CSS *functions*
      },
    })
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
      pattern = "*",
      callback = function()
        require("colorizer").attach_to_buffer(0)
      end,
    })
  end,
}
