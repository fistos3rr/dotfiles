-- define common options
local opts = {
    noremap = true,
    silent = true,
}

vim.g.mapleader = " "

--NORMAL MODE--------------------------------------------

-- Hint: see ':h vim.map.set()'
-- better window nav
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)

vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-right>', ':vertical resize +2<CR>', opts)

-- Neo tree
vim.keymap.set("n", "<F3>", "<CMD>Neotree toggle<CR>")