vim.o.tabline = "%!v:lua.CustomTabline()"

function _G.CustomTabline()
  local s = {}
  local tabs = vim.api.nvim_list_tabpages()
  local current = vim.api.nvim_get_current_tabpage()

  for i, tab in ipairs(tabs) do
    local is_active = (tab == current)

    local filename = ""

    local buflist = vim.fn.tabpagebuflist(tab)
    if buflist and #buflist > 0 then
      local buf = buflist[1]
      filename = vim.fn.fnamemodify(vim.fn.bufname(buf), ":t")
      if filename == "" then
        filename = "[No name]"
      end

      if #filename > 25 then
        filename = filename:sub(1, 22) .. "..."
      end
    end

    if is_active then
      s[i] = "%#TabLineSep# " .. filename .. " %#TabLine#"
    else
      s[i] = "%#TabLine# " .. filename .. " "
    end
  end

  local separator = "|"

  return table.concat(s, separator)
end
