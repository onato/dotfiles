return {
  -- change trouble config
  {
    "weizheheng/ror.nvim",
    -- opts will be merged with the parent spec
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>r",
        desc = "Rails",
      },
      {
        "<leader>rr",
        ":lua require('ror.commands').list_commands()<CR>",
        desc = "All Commands",
      },
      {
        "<leader>ru",
        ":lua require('ror.test').run()<CR>",
        desc = "Test Current File",
      },
      {
        "<leader>rm",
        ":lua require('ror.navigations').go_to_model('normal')<CR>",
        desc = "Goto Model",
      },
      {
        "<leader>rv",
        ":lua require('ror.navigations').go_to_view('normal')<CR>",
        desc = "Goto Model",
      },
      {
        "<leader>rc",
        ":lua require('ror.navigations').go_to_controller('normal')<CR>",
        desc = "Goto Model",
      },
      {
        "<leader>rt",
        ":lua require('ror.navigations').go_to_test('normal')<CR>",
        desc = "Goto Model",
      },
      {
        "<leader>rf",
        desc = "Find",
      },
      {
        "<leader>rfm",
        ":lua require('ror.finders.model').find()<CR>",
        desc = "Find Model",
      },
      {
        "<leader>rfv",
        ":lua require('ror.finders.view').find()<CR>",
        desc = "Find View",
      },
      {
        "<leader>rfc",
        ":lua require('ror.finders.controller').find()<CR>",
        desc = "Find Controller",
      },
    },

    opts = {},
  },
}
