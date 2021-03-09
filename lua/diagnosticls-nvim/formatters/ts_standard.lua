local fs = require 'diagnosticls-nvim.fs'

return {
  command = fs.executable('ts-standard', 'node'),
  args = { '--fix', '--stdin', '--stdin-filename', '%filepath' },
  rootPatterns = {
    '.git',
  },
}
