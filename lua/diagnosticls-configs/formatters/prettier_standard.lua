local fs = require 'diagnosticls-configs.fs'

return {
  sourceName = 'prettier_standard',
  command = fs.get_executable('prettier-standard', 'node'),
  args = {'--stdin'},
  rootPatterns = {'.prettierignore'},
}
