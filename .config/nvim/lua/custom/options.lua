vim.o.cursorcolumn = true -- show the vertical line where the cursor is
vim.o.guicursor = ""      -- block cursor in insert mode as well
vim.o.colorcolumn = "120" -- shows a line at column 120
vim.o.scrolloff = 0       -- leave the cursor 8 lines in from the top or bottom when scrolling
vim.o.relativenumber = true
vim.o.hlsearch = true     -- Set highlight on search
vim.wo.number = true      -- Make line numbers default
vim.o.mouse = 'a'         -- Enable mouse mode

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

vim.o.breakindent = true               -- Enable break indent
vim.o.undofile = true                  -- Save undo history
vim.o.ignorecase = true                -- Case-insensitive searching UNLESS \C or capital in search
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'              -- Keep signcolumn on by default
vim.o.updatetime = 250                 -- Decrease update time
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.o.termguicolors = true             -- NOTE: You should make sure your terminal supports this

vim.cmd.colorscheme "catppuccin-mocha"


-- NetRW
-- <CR>/v/t to open in a split
-- :help netrw-browse-maps to view key mappings
vim.g.netrw_liststyle = 3
-- vim.g.netrw_banner = 0                                                                  -- Hide banner
-- vim.g.netrw_browse_split = 4                                                            -- Open in previous window
vim.g.netrw_altv = 1                                                                    -- Open with right splitting
vim.g.netrw_liststyle = 3                                                               -- Tree-style view
vim.g.netrw_list_hide = (vim.fn["netrw_gitignore#Hide"]()) .. [[,\(^\|\s\s\)\zs\.\S\+]] -- use .gitignore
