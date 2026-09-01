-- define common options
local opts = {
    noremap = true,
    silent = true,
}

vim.g.mapleader = " "

local map = vim.keymap.set

-- Debugger
local dap = require("dap")
map("n", "<F5>", dap.continue, { desc = "Start/Continue debugging" })
map("n", "<F10>", dap.step_over, { desc = "Step over" })
map("n", "<F11>", dap.step_into, { desc = "Step into" })
map("n", "<F12>", dap.step_out, { desc = "Step out" })
map("n", "<leader>b", dap.toggle_breakpoint, { desc = "Breakpoint" })

-- tabs
map("n", "<A-,>", ":tabp<CR>", opts)
map("n", "<A-.>", ":tabn<CR>", opts)
map("n", "<A->>", ":tabmove +1<CR>", opts)
map("n", "<A-<>", ":tabmove -1<CR>", opts)
map("n", "<A-c>", ":tabc<CR>", opts)

-- buffers
--map("n", "<A-k>", ":bp<CR>", opts)
--map("n", "<A-j>", ":bn<CR>", opts)
--map("n", "<A-l>", ":ls<CR>", {noremap=true,})
--map("n", "<A-h>", ":bd<CR>", opts)

-- tabline
---- jump
--map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
--map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
---- move buffers
--map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
--map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
---- goto buffers
--map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
--map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
--map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
--map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
--map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
--map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
--map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
--map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
--map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
--map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
---- pin buffer
--map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
---- close buffer
--map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
---- restore buffer
--map("n", "<A-s-c>", "<Cmd>BufferRestore<CR>", opts)


-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy find recent files" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find string in cwd" })
map("n", "<leader>fs", "<cmd>Telescope git_status<cr>", { desc = "Find string under cursor in cwd" })
map("n", "<leader>fc", "<cmd>Telescope git commits<cr>", { desc = "Find todos" })


-- lsp keymaps
map("n", "<leader>k", vim.lsp.buf.hover, { desc = "Hover Documentation" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Action" })

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
