return  { "simrat39/rust-tools.nvim",
  {
    "saecki/crates.nvim",
    version = "v0.4.0",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup {
        -- null_ls = {
        --   enabled = true,
        --   name = "crates.nvim",
        -- },
        -- popup = {
        --   border = "rounded",
        -- },
      }
    end,
  }
}

