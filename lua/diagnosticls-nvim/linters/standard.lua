local fs = require 'diagnosticls-nvim.fs'

return {
  sourceName = 'standard',
  command = fs.get_executable('standard', 'node'),
  debounce = 100,
  args = {'--stdin'},
  offsetLine = 0,
  offsetColumn = 0,
  formatLines = 1,
  formatPattern = {
    [[^\s*<\w+>:(\d+):(\d+):\s+(.*)(\r|\n)*$]],
    {line = 1, column = 2, message = 3},
  },
  rootPatterns = {'.git'},
}
