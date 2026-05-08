-- define common options
local opts = {
    noremap = true,
    silent = true,
}

vim.g.mapleader = " "

local map = vim.keymap.set

-- auto pairs no plugins
map("i", "`", "``<left>")
map("i", '"', '""<left>')
map("i", "(", "()<left>")
map("i", "[", "[]<left>")
map("i", "{", "{}<left>")
map("i", "<", "<><left>") 

-- diagnostic keymaps
local diagnostic_goto = function(next, severity)
    severity = severity and vim.diagnostic.severity[severity] or nil
    return function()
        vim.diagnostic.jump({ count = next and 1 or -1, float = true, severity = severity })
    end
end

map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

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

-- Visual Mode ------------------------------------------
vim.keymap.set('n', '<leader>y', '"+y', opts)
vim.keymap.set('n', '<leader>p', '"+p', opts)
