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
