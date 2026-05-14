return {
  'romgrk/barbar.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    clickable = true,
    focus_on_close = 'left',
    animation = true,
    icons = {
      button = '',
      buffer_index = false,
      buffer_number = true,
      diagnostics = {
        [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
      },
      filetype = {
        custom_colors = false,
        enabled = true,
      },
      separator = {left = '▎', right = ''},
      modified = {button = '●'},

      exclude_name = {
        'package.json',
      },

      hide = {extensions = true, inactive = true},

      no_name_title = nil,
    }
  },
  version = '^1.0.0',
}
