vim.api.nvim_create_user_command("LspRestart", function()
  vim.lsp.stop_client(vim.lsp.get_active_clients())

  local buf = vim.api.nvim_get_current_buf()
  local filename = vim.api.nvim_buf_get_name(buf)
  local modified = vim.api.nvim_buf_get_option(buf, "modified")

  if filename ~= "" and not modified then
    vim.cmd("edit")
    vim.notify("LSP clients stopped and buffer reloaded", vim.log.levels.INFO)
  else
    vim.notify("Cant restart LSP, no file provided for edit command")
  end
end,
{ desc = "Restart all LSP clients and reload buffer" })
