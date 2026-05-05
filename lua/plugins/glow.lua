-- lazyvim config
return {
  {
    "ellisonleao/glow.nvim",
    config = function()
      require("glow").setup({
        style = "dark", -- options: dark, light, etc.
        width = 80,     -- wrap width
        border = "rounded",
      })
    end,
    cmd = "Glow", -- lazy-load on :Glow
  },
}
