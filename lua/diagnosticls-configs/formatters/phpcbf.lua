local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'phpcbf',
  command = fs.executable('phpcbf', fs.Scope.COMPOSER),
  isStdout = true,
  ignoreExitCode = true,
  rootPatterns = { 'composer.json' },
}
