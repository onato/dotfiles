return {
  -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',
  event = "VeryLazy",
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help ibl`
  main = 'ibl',
  opts = function(_, opts)
    return require("indent-rainbowline").make_opts(opts)
  end,
  dependencies = {
    "TheGLander/indent-rainbowline.nvim",
  },
}
