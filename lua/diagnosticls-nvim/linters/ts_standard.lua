local fs = require 'diagnosticls-nvim.fs'

return {
  sourceName = 'ts_standard',
  command = fs.get_executable('ts-standard', 'node'),
  debounce = 100,
  args = { '--stdin', '--stdin-filename', '%filepath', '--verbose' },
  offsetLine = 0,
  offsetColumn = 0,
  formatLines = 1,
  formatPattern = {
    [[^\s*([^:]+):(\d+):(\d+):\s([^:]+)$]],
    {
      line = 2,
      column = 3,
      message = 4,
    },
  },
  rootPatterns = {
    '.git',
    '.gitignore',
  },
}
