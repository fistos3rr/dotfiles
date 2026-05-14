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

require('mason-lspconfig').setup({})

local function on_attach(client, bufnr)
  if client.name == 'gopls' and not client.server_capabilities.semanticTokensProvider then
    local semantic = client.config.capabilities.textDocument.semanticTokens
    client.server_capabilities.semanticTokensProvider = {
      full = true,
      legend = {tokenModifiers = semantic.tokenModifiers, tokenTypes = semantic.tokenTypes},
      range = true,
    }
  end
end

vim.highlight.priorities.semantic_tokens = 95

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
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  on_attach = on_attach,
  settings = {
    gopls = {
      semanticTokens = true,
      hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                constantValues = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
            analyses = {
                nilness = true,
                unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
            codelenses = {
                gc_details = false,
                generate = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
            },
            usePlaceholders = true,
            completeUnimported = true,
    }
  }
})


vim.lsp.enable('ts_ls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('ty')
vim.lsp.enable('gopls')
