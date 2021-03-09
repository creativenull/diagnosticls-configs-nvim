local fs = require 'diagnosticls-nvim.fs'

return {
  command = fs.get_executable('ts-standard', 'node'),
  args = { '--fix', '--stdin', '--stdin-filename', '%filepath' },
  rootPatterns = {
    '.git',
  },
}
