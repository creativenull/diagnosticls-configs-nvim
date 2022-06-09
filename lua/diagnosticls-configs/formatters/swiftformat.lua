local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'swiftformat',
  command = fs.executable('swiftformat'),
  args = {
    '%filepath',
  },
  rootPatterns = { 'Package.swift', '.git' },
}
