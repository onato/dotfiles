local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
  },
  v = {
    ["p"] = { "_dP" }
  }
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Tobble Breakpoint" },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "update crates"
    }
  }
}

M.test = {
  n = {
    ["<leader>ts"] = { "<cmd> TestSuite <CR>", "✅ Test Suite" },
    ["<leader>u"] = { "<cmd> TestSuite <CR>", "✅ Test Suite" },
    ["<leader>tn"] = { "<cmd> TestNearest <CR>", "✅ Test Nearest" },
    ["<leader>tf"] = { "<cmd> TestFile <CR>", "✅ Test File" },
    ["<leader>tl"] = { "<cmd> TestLast <CR>", "✅ Test Last" },
    ["<leader>tv"] = { "<cmd> TestVisit <CR>", "✅ Test Visit" },
  }
}

return M
