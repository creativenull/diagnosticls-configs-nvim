local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'vint',
  command = fs.get_executable('vint'),
  args = { '--enable-neovim', '--json', '%tempfile' },
  debounce = 100,
  parseJson = {
    sourceName = 'file_path',
    line = 'line_number',
    column = 'column_number',
    security = 'severity',
    message = '[vint] ${description} [${policy_name}]',
  },
  securities = {
    error = 'error',
    warning = 'warning',
    style_problem = 'info',
  },
}
