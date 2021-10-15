local fs = require 'diagnosticls-configs.fs'

-- TODO: Find a way to implement this with stdio, if possible
return {
  sourceName = 'eslint_fmt',
  command = fs.get_executable('eslint', 'node'),
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
