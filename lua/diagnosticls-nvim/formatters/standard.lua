local fs = require 'diagnosticls-nvim.fs'

return {
  command = fs.get_executable('standard', 'node'),
  args = { '--fix', '--stdin' },
  rootPatterns = {
    '.git',
  },
}
