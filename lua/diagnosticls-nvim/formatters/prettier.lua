local fs = require 'diagnosticls-nvim.fs'

return {
  sourceName = 'prettier',
  command = fs.get_executable('prettier', 'node'),
  args = {'--stdin', '--stdin-filepath', '%filepath'},
  rootPatterns = {
    '.prettierrc',
    '.prettierrc.json',
    '.prettierrc.toml',
    '.prettierrc.json',
    '.prettierrc.yml',
    '.prettierrc.yaml',
    '.prettierrc.json5',
    '.prettierrc.js',
    '.prettierrc.cjs',
    'prettier.config.js',
    'prettier.config.cjs',
  },
}
