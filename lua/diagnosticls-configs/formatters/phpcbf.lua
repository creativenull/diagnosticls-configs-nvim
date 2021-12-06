local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'phpcbf',
  command = fs.executable('phpcbf', fs.Scope.COMPOSER),
  args = { '-' },
  isStdout = true,
  ignoreExitCode = true,
  rootPatterns = { 'composer.json' },
}
