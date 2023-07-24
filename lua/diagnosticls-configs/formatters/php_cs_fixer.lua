local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'php-cs-fixer',
  command = fs.executable('php-cs-fixer', fs.Scope.COMPOSER),
  args = { '%relativepath' },
  isStdout = false,
  doesWriteToFile = true,
  ignoreExitCode = true,
  rootPatterns = { 'composer.json' },
}
