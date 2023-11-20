return {
  "klen/nvim-test",
  config = function()
    require('nvim-test').setup {
      term = "toggleterm",
    }
  end
}
