-- Import the keymap module
-- ~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/config
local keymap = vim.keymap


-- Navigation.
vim.keymap.set("n", "<C-t>", ":NvimTreeToggle<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-f>", ":NvimTreeFindFileToggle<CR>", { silent = true, noremap = true })

keymap.set("n", "<C-w>m", "<C-w>h", { desc = "Move to left split" })
keymap.set("n", "<C-w>i", "<C-w>l", { desc = "Move to right split" })
keymap.set("n", "<C-w>n", "<C-w>j", { desc = "Move to split below" })
keymap.set("n", "<C-w>e", "<C-w>k", { desc = "Move to split above" })

-- Quickfix
vim.api.nvim_set_keymap('n', '<C-s>n', ':cnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>e', ':cprev<CR>', { noremap = true, silent = true })

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

-- Remapping mini.ai
-- vim.keymap.set({ "x", "o" }, "a(", "<cmd>lua MiniAi.select_textobject('a', '(')<CR>")
-- vim.keymap.set({ "x", "o" }, "i(", "<cmd>lua MiniAi.select_textobject('i', '(')<CR>")
-- vim.keymap.set({ "x", "o" }, "a)", "<cmd>lua MiniAi.select_textobject('a', ')')<CR>")
-- vim.keymap.set({ "x", "o" }, "i)", "<cmd>lua MiniAi.select_textobject('i', ')')<CR>")
-- vim.keymap.set({ "x", "o" }, "a{", "<cmd>lua MiniAi.select_textobject('a', '{')<CR>")
-- vim.keymap.set({ "x", "o" }, "i{", "<cmd>lua MiniAi.select_textobject('i', '{')<CR>")
-- vim.keymap.set({ "x", "o" }, "a}", "<cmd>lua MiniAi.select_textobject('a', '}')<CR>")
-- vim.keymap.set({ "x", "o" }, "i}", "<cmd>lua MiniAi.select_textobject('i', '}')<CR>")
-- vim.keymap.set({ "x", "o" }, "a[", "<cmd>lua MiniAi.select_textobject('a', '[')<CR>")
-- vim.keymap.set({ "x", "o" }, "i[", "<cmd>lua MiniAi.select_textobject('i', '[')<CR>")
-- vim.keymap.set({ "x", "o" }, "a]", "<cmd>lua MiniAi.select_textobject('a', ']')<CR>")
-- vim.keymap.set({ "x", "o" }, "i]", "<cmd>lua MiniAi.select_textobject('i', ']')<CR>")
--
-- vim.keymap.set({ "x", "o" }, "i\"", "<cmd>lua MiniAi.select_textobject('i', '\"')<CR>")
-- vim.keymap.set({ "x", "o" }, "a\"", "<cmd>lua MiniAi.select_textobject('a', '\"')<CR>")
-- vim.keymap.set({ "x", "o" }, "i'", "<cmd>lua MiniAi.select_textobject('i', '`')<CR>")
-- vim.keymap.set({ "x", "o" }, "a'", "<cmd>lua MiniAi.select_textobject('a', '`')<CR>")
-- vim.keymap.set({ "x", "o" }, "i\'", "<cmd>lua MiniAi.select_textobject('i', '\'')<CR>")
-- vim.keymap.set({ "x", "o" }, "a\'", "<cmd>lua MiniAi.select_textobject('a', '\'')<CR>")
--
-- vim.keymap.set({ "x", "o" }, "i<", "<cmd>lua MiniAi.select_textobject('i', '<')<CR>")
-- vim.keymap.set({ "x", "o" }, "a<", "<cmd>lua MiniAi.select_textobject('a', '<')<CR>")
-- vim.keymap.set({ "x", "o" }, "i>", "<cmd>lua MiniAi.select_textobject('i', '>')<CR>")
-- vim.keymap.set({ "x", "o" }, "a>", "<cmd>lua MiniAi.select_textobject('a', '>')<CR>")


-- Easily hit escape in terminal mode.
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

-- Open a terminal at the bottom of the screen with a fixed height.
vim.keymap.set("n", ",st", function()
    vim.cmd.new()
    vim.cmd.wincmd "J"
    vim.api.nvim_win_set_height(0, 12)
    vim.wo.winfixheight = true
    vim.cmd.term()
end)

vim.keymap.set("n", "<C-r>e", ":resize +2<CR>", { silent = true })
vim.keymap.set("n", "<C-r>n", ":resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-r>m", ":vertical resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-r>i", ":vertical resize +2<CR>", { silent = true })



-- Testing
vim.api.nvim_set_keymap("n", "<leader>tn", ":TestNearest<CR>", { noremap = true, silent = true }) -- Run the nearest test
vim.api.nvim_set_keymap("n", "<leader>tf", ":TestFile<CR>", { noremap = true, silent = true })    -- Run tests in the current file
vim.api.nvim_set_keymap("n", "<leader>ts", ":TestSuite<CR>", { noremap = true, silent = true })   -- Run the entire test suite
vim.api.nvim_set_keymap("n", "<leader>tl", ":TestLast<CR>", { noremap = true, silent = true })    -- Re-run the last test
vim.api.nvim_set_keymap("n", "<leader>tv", ":TestVisit<CR>", { noremap = true, silent = true })   -- Visit the last test

vim.keymap.set("n", "<space>fd", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")

