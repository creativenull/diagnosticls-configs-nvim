local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'eslint_d_fmt',
  command = fs.executable('eslint_d', fs.Scope.NODE),
  args = {
    '--fix-to-stdout',
    '--stdin',
    '--stdin-filename',
    '%filepath',
  },
  rootPatterns = {
    '.eslintrc',
    '.eslintrc.cjs',
    '.eslintrc.js',
    '.eslintrc.json',
    '.eslintrc.yaml',
    '.eslintrc.yml',
  },
}
