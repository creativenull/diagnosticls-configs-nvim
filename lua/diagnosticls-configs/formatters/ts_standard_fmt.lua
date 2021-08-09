local fs = require 'diagnosticls-configs.fs'

return {
  sourceName = 'ts_standard_fmt',
  command = fs.get_executable('ts-standard', 'node'),
  args = {'--fix', '--stdin', '--stdin-filename', '%filepath'},
  rootPatterns = {'.git'},
}
