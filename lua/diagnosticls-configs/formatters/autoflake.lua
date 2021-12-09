local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'autoflake',
  command = fs.executable('autoflake'),
  args = { '--in-place', '%file' },
  isStderr = false,
  isStdout = false,
  doesWriteToFile = true,
  rootPatterns = { '.git' },
}
