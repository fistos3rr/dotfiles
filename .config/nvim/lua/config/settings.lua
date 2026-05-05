vim.opt.clipboard = 'unnamedplus' -- clipboard
vim.opt.completeopt = {'menu', 'menuone'}
vim.opt.mouse = 'a'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true

vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

--pythonindent
vim.g.python_indent = {
    disable_parentheses_indenting = false,
    closed_paren_align_last_line = false,
    searchpair_timeout = 150,
    continue = vim.opt.shiftwidth,
    open_paren = vim.opt.shiftwidth,
    nested_paren = vim.opt.shiftwidth
}
