local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'swiftformat',
  command = fs.executable('swiftformat'),
  isStdout = false,
  isStderr = true,
  args = {
    '--lint',
    'stdin',
    '--stdinpath',
    '%filepath'
  },
  debounce = 100,
  offsetLine = 0,
  offsetColumn = 0,
  formatLines = 1,
  formatPattern = {
    [[.*:(\d+):(\d+): (\w+): (.*)(\r|\n)*$]],
    { line = 1, column = 2, security = 3, message = { '[swift-format] ', 4 } },
  },
  securities = {
    warning = 'warning'
  },
  rootPatterns = {
    'Package.swift',
    '.swiftformat',
    '.git'
  },
}
