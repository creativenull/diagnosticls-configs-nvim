local fs = require 'diagnosticls-nvim.fs'

return {
  sourceName = 'stylelint',
  command = fs.get_executable('stylelint', 'node'),
  debounce = 100,
  args = { '--formatter', 'json', '--stdin-filename', '%filepath' },
  parseJson = {
    errorsRoot = '[0].warnings',
    line = 'line',
    column = 'column',
    message = '${text}',
    security = 'severity',
  },
  securities = {
    error = 'error',
    warning = 'warning',
  },
  rootPatterns = {
    '.git',
  },
}
