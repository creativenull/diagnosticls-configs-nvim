local fs = require 'diagnosticls-nvim.fs'

return {
  sourceName = 'standard_fmt',
  command = fs.get_executable('standard', 'node'),
  args = { '--fix', '--stdin' },
  rootPatterns = {
    '.git',
  },
}
