vim.opt.tabstop = 2      -- Number of visual spaces per tab
vim.opt.shiftwidth = 2   -- Number of spaces for autoindent
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.softtabstop = 2  -- Number of spaces for tab navigation

vim.api.nvim_set_keymap('n', '<leader>g', ':lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("TS_add_missing_imports", { clear = true }),
  desc = "TS_add_missing_imports",
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
  callback = function()
    vim.lsp.buf.code_action({
      apply = true,
      context = {
        only = { "source.addMissingImports.ts" },
      },
    })
    vim.cmd("write")
  end,
})

-- Enable Tree-sitter based folding
vim.opt.foldmethod = "expr"        -- Use expression-based folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- Use Tree-sitter's fold expression

-- Set default fold level (0 = folded, 99 = unfolded)
vim.opt.foldlevel = 99             -- Start with all folds open
vim.opt.foldlevelstart = 99        -- Open files with all folds unfolded
vim.opt.foldenable = true          -- Enable folding by default

require('nvim-treesitter.configs').setup({
  fold = { enable = true },
})

-- Remap folding keys
vim.keymap.set('n', '<Space>z', 'za', { desc = "Toggle fold under cursor" }) -- Space+z to toggle a fold
vim.keymap.set('n', '<Space>O', 'zO', { desc = "Open all nested folds" })    -- Space+Shift+O to open all nested folds
vim.keymap.set('n', '<Space>C', 'zC', { desc = "Close all nested folds" })   -- Space+Shift+C to close all nested folds
vim.keymap.set('n', '<Space>R', 'zR', { desc = "Open all folds in the file" }) -- Space+Shift+R to open all folds
vim.keymap.set('n', '<Space>M', 'zM', { desc = "Close all folds in the file" }) -- Space+Shift+M to close all folds

