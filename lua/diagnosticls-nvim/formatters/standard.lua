local fs = require 'diagnosticls-nvim.fs'

return {
  command = fs.executable('standard', 'node'),
  args = { '--fix', '--stdin' },
  rootPatterns = {
    '.git',
  },
}
