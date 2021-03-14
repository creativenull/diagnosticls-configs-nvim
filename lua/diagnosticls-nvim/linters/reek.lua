local fs = require 'diagnosticls-nvim.fs'

return {
  sourceName = 'reek',
  command = fs.get_executable('bundle'),
  debounce = 100,
  args = { 'exec', 'reek', '--format', 'json', '--force-exclusion', '--stdin-filename', '%filepath' },
  parseJson = {
    line = 'lines[0]',
    endLine = 'lines[1]',
    message = '[${smell_type}] ${message}',
  },
  securities = {
    undefined = 'info',
  },
}
