return {
  "klen/nvim-test",
  config = function()
    require('nvim-test').setup {
      term = "toggleterm",
      termOpts = {
        width = 99,
      }
    }
    require('nvim-test.runners.cargo-test'):setup {
      command = "cargo",
      args = { "test", "-q" },

      package = false, -- Set to true, to find the nearest create root
    }
  end
}
