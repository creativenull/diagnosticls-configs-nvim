local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'phpcbf',
  command = fs.get_executable('phpcbf', 'php'),
  isStdout = true,
  ignoreExitCode = true,
  rootPatterns = { 'composer.json' },
}
