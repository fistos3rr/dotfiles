require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff", "black", stop_after_first = true},
    json = { "prettier" },
    markdown = { "prettier" },
    javascript = { "biome", "prettier", stop_after_first = true },
    typescript = { "biome", "prettier", stop_after_first = true },
    javascriptreact =  { "biome", "prettier", stop_after_first = true },
    typescriptreact = { "biome", "prettier", stop_after_first = true },
    css = { "prettier" },
    html = { "prettier" },
  },

  formatters = {
    biome = { require_cwd = true },
  },

  default_format_opts = {
    lsp_format = "fallback",
  },

  vim.keymap.set({ "n", "v" }, "<leader>f", function()
    require("conform").format({ async = true }, function(err, did_edit)
      if not err and did_edit then
        vim.notify("Code formatted", vim.log.levels.INFO, { title = "Conform" })
      end
    end)
  end, { desc = "Format buffer" })
})
