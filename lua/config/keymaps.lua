-- Import the keymap module
-- ~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/config
local keymap = vim.keymap

-- Unmap 'n' and 'N' in normal mode to disable their default search navigation
keymap.set("n", "n", "", { silent = true }) -- Unmap 'n'
keymap.set("n", "N", "", { silent = true }) -- Unmap 'N'

-- Normal mode mappings
keymap.set("n", "h", "n", { silent = true })
keymap.set("n", "H", "N", { silent = true })
keymap.set("n", "u", "i", { silent = true })
keymap.set("n", "n", "j", { silent = true }) -- Remap 'n' to 'j'
keymap.set("n", "e", "k", { silent = true })
keymap.set("n", "i", "l", { silent = true })
keymap.set("n", "m", "h", { silent = true })
keymap.set("n", "z", "u", { silent = true })

-- Visual mode mappings
keymap.set("v", "u", "i", { silent = true })
keymap.set("v", "n", "j", { silent = true })
keymap.set("v", "e", "k", { silent = true })
keymap.set("v", "i", "l", { silent = true })
keymap.set("v", "m", "h", { silent = true })

-- Operator-pending mode mappings
keymap.set("o", "u", "i", { silent = true })
keymap.set("o", "n", "j", { silent = true })
keymap.set("o", "e", "k", { silent = true })
keymap.set("o", "i", "l", { silent = true })
keymap.set("o", "m", "h", { silent = true })


-- Navigation.
keymap.set("n", "<leader>n", ":NERDTreeFocus<CR>")
keymap.set("n", "<C-n>", ":NERDTree<CR>")
keymap.set("n", "<C-t>", ":NERDTreeToggle<CR>")
keymap.set("n", "<C-f>", ":NERDTreeFind<CR>")
vim.api.nvim_create_autocmd("FileType", {
  pattern = "nerdtree",
  callback = function()
    keymap.set("n", "n", "j", { buffer = true })
    keymap.set("n", "e", "k", { buffer = true })
  end,
})
keymap.set("n", "<C-w>m", "<C-w>h", { desc = "Move to left split" })
keymap.set("n", "<C-w>i", "<C-w>l", { desc = "Move to right split" })
keymap.set("n", "<C-w>n", "<C-w>j", { desc = "Move to split below" })
keymap.set("n", "<C-w>e", "<C-w>k", { desc = "Move to split above" })

vim.keymap.set("n", "<C-w>-", ":tabnew<CR>")


vim.opt.encoding = "utf-8"

-- Lua
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")


-- Autocompletion


-- edition
vim.wo.number = true
vim.wo.relativenumber = true


vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format() end)
