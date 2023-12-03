vim.opt.cursorcolumn = true -- show the vertical line where the cursor is
vim.opt.guicursor = ""      -- block cursor in insert mode as well
vim.opt.colorcolumn = "120" -- shows a line at column 120
vim.opt.scrolloff = 0       -- leave the cursor 8 lines in from the top or bottom when scrolling
vim.opt.relativenumber = true

vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0                                                                  -- Hide banner
vim.g.netrw_browse_split = 4                                                            -- Open in previous window
vim.g.netrw_altv = 1                                                                    -- Open with right splitting
vim.g.netrw_liststyle = 3                                                               -- Tree-style view
vim.g.netrw_list_hide = (vim.fn["netrw_gitignore#Hide"]()) .. [[,\(^\|\s\s\)\zs\.\S\+]] -- use .gitignore
