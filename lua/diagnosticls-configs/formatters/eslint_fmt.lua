local fs = require('diagnosticls-configs.fs')

-- TODO: Find a way to implement this with stdio, if possible
return {
  sourceName = 'eslint_fmt',
  command = fs.executable('eslint', fs.Scope.NODE),
  args = {
    '--fix',
    '%file',
  },
  isStdout = false,
  doesWriteToFile = true,
  rootPatterns = {
    '.eslintrc',
    '.eslintrc.cjs',
    '.eslintrc.js',
    '.eslintrc.json',
    '.eslintrc.yaml',
    '.eslintrc.yml',
  },
}
