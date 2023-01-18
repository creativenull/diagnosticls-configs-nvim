local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'yamllint',
  command = fs.executable('yamllint'),
  debounce = 100,
  args = {
    '-f',
    'parsable',
    '%filepath'
  },
  formatPattern = {
    [[^.*:(\d+):(\d+): \[(\w+)\] (.*)$]],
    { line = 1, column = 2, security = 3, message = { '[yamllint] ', 4 } }
  },
  securities = {
    warning = 'warning',
    error = 'error'
  }
}
