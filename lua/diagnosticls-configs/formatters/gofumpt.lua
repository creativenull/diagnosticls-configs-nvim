local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'gofumpt',
  command = fs.executable('gofumpt'),
  args = { '%filepath' },
  rootPatterns = { 'go.mod', '.git' },
}
