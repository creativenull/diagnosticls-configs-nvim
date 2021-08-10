local fs = require 'diagnosticls-configs.fs'

return {
  sourceName = 'xo_fmt',
  command = fs.get_executable('xo', 'node'),
  args = {'--stdin', '--stdin-filename', '%filepath', '--fix'},
  rootPatterns = {'.git', '.eslintignore'},
}
