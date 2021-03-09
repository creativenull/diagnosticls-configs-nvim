local fs = require 'diagnosticls-nvim.fs'

return {
  command = fs.get_executable('prettier-standard', 'node'),
  args = { '--stdin' },
  rootPatterns = {
    '.prettierignore'
  }
}
