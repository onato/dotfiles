return {
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  opts = {
    -- See `:help gitsigns.txt`
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    on_attach = function(bufnr)
      vim.keymap.set('n', '<leader>gp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })

      -- don't override the built-in and fugitive keymaps
      local gs = package.loaded.gitsigns
      vim.keymap.set({ 'n', 'v' }, ']c', function()
        if vim.wo.diff then
          return ']c'
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return '<Ignore>'
      end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
      vim.keymap.set({ 'n', 'v' }, '[c', function()
        if vim.wo.diff then
          return '[c'
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return '<Ignore>'
      end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })

      vim.keymap.set('n', '<leader>hs', gs.stage_hunk, { desc = 'Stage Hunk' })
      vim.keymap.set('n', '<leader>hr', gs.reset_hunk, { desc = 'Reset Hunk' })
      vim.keymap.set('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
        { desc = 'Stage Hunk' })
      vim.keymap.set('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
        { desc = 'Reset Hunk' })
      vim.keymap.set('n', '<leader>hS', gs.stage_buffer, { desc = 'Stage Buffer' })
      vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'Undo Stage Hunk' })
      vim.keymap.set('n', '<leader>hR', gs.reset_buffer, { desc = 'Reset Buffer' })
      vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { desc = 'Preview Hunk' })
      vim.keymap.set('n', '<leader>hd', gs.diffthis, { desc = 'Diff this' })
      vim.keymap.set('n', '<leader>hD', function() gs.diffthis('~') end, { desc = 'Diff this ~' })
    end,
  },
}
