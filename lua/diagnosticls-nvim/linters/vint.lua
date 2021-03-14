local fs = require 'diagnosticls-nvim.fs'

return {
  sourceName = 'vint',
  command = fs.get_executable('vint'),
  args = { '--enable-neovim', '-' },
  debounce = 100,
  offsetLine = 0,
  offsetColumn = 0,
  formatLines = 1,
  formatPattern = {
    [[[^:]+:(\d+):(\d+):\s*(.*)(\r|\n)*$]],
    {
      line = 1,
      column = 2,
      message = 3,
    },
  },
}
