local fs = require 'diagnosticls-nvim.fs'

return {
  sourceName = 'prettier_standard',
  command = fs.get_executable('prettier-standard', 'node'),
  args = {'--stdin'},
  rootPatterns = {'.prettierignore'},
}
