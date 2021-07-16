local fs = require 'diagnosticls-nvim.fs'

return {
  sourceName = 'psalm',
  command = fs.get_executable('psalm', 'php'),
  args = {'--output-format=emacs', '--no-progress'},
  debounce = 100,
  offsetLine = 0,
  offsetColumn = 0,
  formatLines = 1,
  formatPattern = {
    [[^[^:]+:(\d):(\d):(.*)\s-\s(.*)(\r|\n)*$]],
    {line = 1, column = 2, security = 3, message = {'[psalm] ', 4}},
  },
  securities = {error = 'error', warning = 'warning'},
  requiredFiles = {'psalm.xml'},
  rootPatterns = {'.git', 'vendor', 'composer.json'},
}
