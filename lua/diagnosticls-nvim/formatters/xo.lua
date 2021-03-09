local fs = require 'diagnosticls-nvim.fs'

return {
  command = fs.get_executable('xo', 'node'),
  args = { '--stdin', '--stdin-filename', '%filepath', '--fix' },
  rootPatterns = {
    '.git',
    '.eslintignore',
  },
}
