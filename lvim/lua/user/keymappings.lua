-- Move the close buffer command to <leader>x
lvim.builtin.which_key.mappings['f'] = {
  function()
    require("lvim.core.telescope.custom-finders").find_project_files {
      previewer = true
    }
  end,
  "Find File",
}
lvim.lsp.buffer_mappings.normal_mode['<leader>lh'] = { vim.lsp.buf.hover, "Show documentation" }

lvim.lsp.buffer_mappings.normal_mode['<leader>a'] = {
  "<cmd>lua require(\"harpoon.mark\").add_file()<CR>", "Add to Harpoon"
}
local ui = require("harpoon.ui")
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-l>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-;>", function() ui.nav_file(4) end)

lvim.keys.normal_mode["<leader>U"] = ":TestSuite<CR>"
lvim.keys.normal_mode["<leader>u"] = ":TestFile<CR>"
lvim.builtin.which_key.mappings["<leader>"] = {
  "<C-^>", "Switch to Altername File"
}
lvim.keys.insert_mode["<C-b>"] = "<esc><C-^>"

vim.api.nvim_set_keymap("n", "<m-d>", "<cmd>RustOpenExternalDocs<Cr>", { noremap = true, silent = true })

lvim.lsp.buffer_mappings.normal_mode['<leader>sb'] = { ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  "File Browser" }
lvim.builtin.which_key.mappings["h"] = {
  ui.toggle_quick_menu, "Harpoon"
}

lvim.builtin.which_key.mappings["C"] = {
  name = "Rust",
  r = { "<cmd>RustRunnables<Cr>", "Runnables" },
  t = { "<cmd>:TestSuite<cr>", "Cargo Test" },
  m = { "<cmd>RustExpandMacro<Cr>", "Expand Macro" },
  c = { "<cmd>RustOpenCargo<Cr>", "Open Cargo" },
  p = { "<cmd>RustParentModule<Cr>", "Parent Module" },
  d = { "<cmd>RustDebuggables<Cr>", "Debuggables" },
  v = { "<cmd>RustViewCrateGraph<Cr>", "View Crate Graph" },
  R = {
    "<cmd>lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<Cr>",
    "Reload Workspace",
  },
  o = { "<cmd>RustOpenExternalDocs<Cr>", "Open External Docs" },
  y = { "<cmd>lua require'crates'.open_repository()<cr>", "[crates] open repository" },
  P = { "<cmd>lua require'crates'.show_popup()<cr>", "[crates] show popup" },
  i = { "<cmd>lua require'crates'.show_crate_popup()<cr>", "[crates] show info" },
  f = { "<cmd>lua require'crates'.show_features_popup()<cr>", "[crates] show features" },
  D = { "<cmd>lua require'crates'.show_dependencies_popup()<cr>", "[crates] show dependencies" },
}

lvim.builtin.which_key.mappings["m"] = {
  name = "Mobile Core",
  m = {
    "<cmd>lua require('telescope.builtin').find_files({search_dirs={'src/models'}, prompt_title='Models', layout_strategy='horizontal',layout_config={height=0.6, width=0.6}})<cr>",
    "Models" },
  r = {
    "<cmd>lua require('telescope.builtin').find_files({search_file='_response', prompt_title='Responses', layout_strategy='horizontal',layout_config={height=0.6, width=0.6}})<cr>",
    "Responses" },
  u = {
    "<cmd>lua require('telescope.builtin').find_files({search_file='default_*_use_case', prompt_title='Use Cases', layout_strategy='horizontal',layout_config={height=0.6, width=0.6}})<cr>",
    "Use Cases" },
  p = {
    "<cmd>lua require('telescope.builtin').find_files({search_dirs={'src/services/mappers'}, prompt_title='Mappers', layout_strategy='horizontal',layout_config={height=0.6, width=0.6}})<cr>",
    "Mappers" },
  f = {
    "<cmd>lua require('telescope.builtin').find_files({search_dirs={'src/presenters/features'}, prompt_title='Features', layout_strategy='horizontal',layout_config={height=0.6, width=0.6}})<cr>",
    "Features" },
}
