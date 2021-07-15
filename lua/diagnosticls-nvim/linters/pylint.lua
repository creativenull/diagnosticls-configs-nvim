local fs = require 'diagnosticls-nvim.fs'

return {
  sourceName = 'pylint',
  command = fs.get_executable('pylint'),
  args = {
    '--output-format',
    'text',
    '--score',
    'no',
    '--msg-template',
    [['{line}:{column}:{category}:{msg} ({msg_id}:{symbol})']],
    '%file',
  },
  offsetColumn = 1,
  formatLines = 1,
  formatPattern = {
    [[^(\d+?):(\d+?):([a-z]+?):(.*)$]],
    {line = 1, column = 2, security = 3, message = 4},
  },
  securities = {
    informational = 'hint',
    refactor = 'info',
    convention = 'info',
    warning = 'warning',
    error = 'error',
    fatal = 'error',
  },
  rootPatterns = {'.git', 'pyproject.toml', 'setup.py'},
}
