local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'swiftformat',
  command = fs.executable('swiftformat'),
  args = {
    'stdin',
    '--stdinpath',
    '%filepath'
  },
  rootPatterns = {
    'Package.swift',
    '.swiftformat',
    '.git'
  },
}
