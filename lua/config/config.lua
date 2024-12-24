vim.opt.tabstop = 2        -- Number of visual spaces per tab
vim.opt.shiftwidth = 2     -- Number of spaces for autoindent
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.softtabstop = 2    -- Number of spaces for tab navigation

vim.api.nvim_set_keymap('n', '<leader>g', ':lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })

