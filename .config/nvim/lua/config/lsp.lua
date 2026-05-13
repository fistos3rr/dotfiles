require('mason').setup()

-- use this to install tools
require('mason-tool-installer').setup({
	ensure_installed = {
		'lua_ls',
    'ts_ls',
    'ty',
    'gopls'
	},
})

vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    settings = {
        Lua = {
            diagnostics = { globals = { 'vim' } },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                },
            },
            telemetry = { enable = false },
        },
    },
})

vim.lsp.config('ts_ls', {
    filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' },
    root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json' },
    settings = {
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
            },
        },
        javascript = {
            inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
            },
        },
    },
})

vim.lsp.config('gopls', {
  settings = {
    golsp = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})

require('mason-lspconfig').setup({})

vim.lsp.enable('ts_ls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('ty')
vim.lsp.enable('gopls')
