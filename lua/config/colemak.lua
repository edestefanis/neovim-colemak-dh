


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
