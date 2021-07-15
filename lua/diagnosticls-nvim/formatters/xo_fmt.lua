local fs = require 'diagnosticls-nvim.fs'

return {
  sourceName = 'xo_fmt',
  command = fs.get_executable('xo', 'node'),
  args = {'--stdin', '--stdin-filename', '%filepath', '--fix'},
  rootPatterns = {'.git', '.eslintignore'},
}
