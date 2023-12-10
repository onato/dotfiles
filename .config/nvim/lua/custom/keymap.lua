-- [[ Basic Keymaps ]]
-- Keep the cursor in the middle of the screen when paging up and down
vim.keymap.set('n', "<c-u>", "<c-u>zz")
vim.keymap.set('n', "<c-d>", "<c-d>zz")
-- vim.keymap.set('n', "<c-e>", "<c-e>M")
-- vim.keymap.set('n', "<c-y>", "<c-y>M")
--
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>sm', ":Telescope harpoon marks<CR>", { desc = '[S]earch Harpoon [M]arks' })
vim.keymap.set('n', '<leader>gs', ":Telescope git_status<CR>", { desc = '[G]it [S]tatus' })
vim.keymap.set('n', '<leader>gg', ":vertical Git<CR>", { desc = '[[G]]it' })
vim.keymap.set('n', '<leader>gb', ":Gitsigns toggle_current_line_blame<CR>", { desc = '[G]it Toggle Line [B]lame' })
vim.keymap.set('n', '<leader>gB', ":Git blame<CR>", { desc = '[G]it [B]lame' })
vim.keymap.set('n', '<leader>gc', ':Git commit<CR>', { desc = '[G]it [C]ommit' })
vim.keymap.set('n', '<leader>gP', ':Git push<CR>', { desc = '[G]it [P]ush' })

vim.keymap.set('n', '<leader>ta', ':TestSuite<cr><C-w>w', { desc = 'Test [A]ll' })
vim.keymap.set('n', '<leader>tc', ':!make coverage<cr>', { desc = 'Test [C]overage' })
vim.keymap.set('n', '<leader>tf', ':TestFile<cr>', { desc = 'Test [F]ile' })
vim.keymap.set('n', '<leader>te', ':TestEdit<cr>', { desc = 'Test [E]dit' })
vim.keymap.set('n', '<leader>tn', ':TestNearest<cr>', { desc = 'Test [N]earest' })
vim.keymap.set('n', '<leader>tt', ':TestLast<cr>', { desc = 'Test Las[t]' })
vim.keymap.set('n', '<leader>tv', ':TestVisit<cr>', { desc = 'Test [V]isit' })
vim.keymap.set('n', '<leader>u', ':TestFile<cr><C-w>w', { desc = 'Test Current File' })


vim.keymap.set("n", "<leader>xl", "<cmd>XcodebuildToggleLogs<cr>", { desc = "Toggle Xcodebuild Logs" })
vim.keymap.set("n", "<leader>xb", "<cmd>XcodebuildBuild<cr>", { desc = "Build Project" })
vim.keymap.set("n", "<leader>xr", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & Run Project" })
vim.keymap.set("n", "<leader>xt", "<cmd>XcodebuildTest<cr>", { desc = "Run Tests" })
vim.keymap.set("n", "<leader>xT", "<cmd>XcodebuildTestClass<cr>", { desc = "Run This Test Class" })
vim.keymap.set("n", "<leader>xX", "<cmd>XcodebuildPicker<cr>", { desc = "Show All Xcodebuild Actions" })
vim.keymap.set("n", "<leader>xd", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select Device" })
vim.keymap.set("n", "<leader>xp", "<cmd>XcodebuildSelectTestPlan<cr>", { desc = "Select Test Plan" })
vim.keymap.set("n", "<leader>xs", "<cmd>XcodebuildFailingSnapshots<cr>", { desc = "Show Failing Snapshots" })
vim.keymap.set("n", "<leader>xq", "<cmd>Telescope quickfix<cr>", { desc = "Show QuickFix List" })

vim.keymap.set('n', '<leader>bb', ':bprev<cr>', { desc = '[B]ack' })
vim.keymap.set('n', '<leader>bn', ':bnext<cr>', { desc = '[N]ext' })
vim.keymap.set('n', '<leader>bl', require('telescope.builtin').buffers, { desc = '[L]ist buffers' })
vim.keymap.set('n', '<leader>bd', ':bdelete<cr>', { desc = '[D]elete' })

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>+", mark.add_file, { desc = "[+] to harpoon list" })
vim.keymap.set("n", "<leader>se", ui.toggle_quick_menu, { desc = "Harpoon" })
vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end, { desc = "Harpoon 1" })
vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end, { desc = "Harpoon 2" })
vim.keymap.set("n", "<C-l>", function() ui.nav_file(3) end, { desc = "Harpoon 3" })
vim.keymap.set("n", "<C-;>", function() ui.nav_file(4) end, { desc = "Harpoon 4" })

vim.keymap.set('n', '<leader>mm',
  "<cmd>lua require('telescope.builtin').find_files({search_dirs={'src/models'}, prompt_title='Models', layout_strategy='horizontal',layout_config={height=0.6, width=0.6}})<cr>",
  { desc = '[M]odels' })
vim.keymap.set('n', '<leader>mr',
  "<cmd>lua require('telescope.builtin').find_files({search_file='_response', prompt_title='Responses', layout_strategy='horizontal',layout_config={height=0.6, width=0.6}})<cr>",
  { desc = '[R]esponses' })
vim.keymap.set('n', '<leader>mu',
  "<cmd>lua require('telescope.builtin').find_files({search_file='default_*_use_case', prompt_title='Use Cases', layout_strategy='horizontal',layout_config={height=0.6, width=0.6}})<cr>",
  { desc = '[U]se Cases' })
vim.keymap.set('n', '<leader>mp',
  "<cmd>lua require('telescope.builtin').find_files({search_dirs={'src/services/mappers'}, prompt_title='Mappers', layout_strategy='horizontal',layout_config={height=0.6, width=0.6}})<cr>",
  { desc = 'Ma[p]pers' })
vim.keymap.set('n', '<leader>mf',
  "<cmd>lua require('telescope.builtin').find_files({search_dirs={'src/presenters/features'}, prompt_title='Features', layout_strategy='horizontal',layout_config={height=0.6, width=0.6}})<cr>",
  { desc = '[F]eatuers' })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Implementation" })
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "Type Definition" })

vim.keymap.set('n', '[q', '<cmd>cprev<CR>zz', { desc = 'Go to previous item in the [q]uickfix list' })
vim.keymap.set('n', ']q', '<cmd>cnext<CR>zz', { desc = 'Go to next item in the [q]uickfix list' })

vim.keymap.set('n', '[l', '<cmd>lprev<CR>zz', { desc = 'Go to previous item in the location list' })
vim.keymap.set('n', ']l', '<cmd>lnext<CR>zz', { desc = 'Go to next item in the location list' })

-- LLM Test/Code Generation
vim.keymap.set({ 'n', 'v' }, '<leader>cg', ':Gen<CR>', { desc = "[C]ode [G]enerate" })

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set('n', '<leader>e', ':Explore<cr>', { desc = 'Explore File System' })

require('which-key').register {
  ['<leader>cb'] = { name = '[B]oilerplate', _ = 'which_key_ignore' },
}
vim.keymap.set('n', '<leader>cbs', ':-1read $HOME/.dotfiles/snippets/shell.sh<CR>5ji', { desc = 'Shell' });
vim.keymap.set('n', '<leader>cbx', ':!chmod +x %<CR>', { desc = 'Make executable' });
