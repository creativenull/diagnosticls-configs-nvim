local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'perlcritic',
  command = fs.executable('perlcritic'),
  debounce = 200,
  args = { '--nocolor', '--verbose', '%l:%c:%s %m [%p]\n', '%file' },
  ignoreExitCode = true,
  onSaveOnly = true,
  formatPattern = {
    [[(\d+):(\d+):(\w+) (.+)]],
    { line = 1, column = 2, security = 3, message = 4 },
  },
  securities = {
    ['1'] = vim.diagnostic.severity.HINT,
    ['2'] = vim.diagnostic.severity.INFO,
    ['3'] = vim.diagnostic.severity.WARN,
    ['4'] = vim.diagnostic.severity.WARN,
    ['5'] = vim.diagnostic.severity.ERROR,
  },
  rootPatterns = { '.git', '.perlcriticrc' },
}
