local fs = require 'diagnosticls-configs.fs'

return {
  sourceName = 'prettier_eslint',
  command = fs.get_executable('prettier-eslint', 'node'),
  args = {'--stdin', '--stdin-filepath', '%filepath'},
  rootPatterns = {'.git'},
}
