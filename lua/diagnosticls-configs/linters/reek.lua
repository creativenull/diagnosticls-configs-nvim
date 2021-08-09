local fs = require 'diagnosticls-configs.fs'

return {
  sourceName = 'reek',
  command = fs.get_executable('bundle'),
  debounce = 100,
  args = {
    'exec',
    'reek',
    '--format',
    'json',
    '--force-exclusion',
    '--stdin-filename',
    '%filepath',
  },
  parseJson = {
    line = 'lines[0]',
    endLine = 'lines[1]',
    message = '[reek] [${smell_type}] ${message}',
  },
  securities = {undefined = 'info'},
}
