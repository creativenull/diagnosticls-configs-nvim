local fs = require 'diagnosticls-nvim.fs'

-- TODO
-- This may or may not work? May want to start implementing some tests
return {
  sourceName = 'flow',
  command = fs.get_executable('flow', 'node'),
  debounce = 100,
  args = {'check-contents', '--json', '<', '%filepath'},
  parseJson = {
    errorsRoot = 'errors',
    line = 'message[0].loc.start.line',
    column = 'message[0].loc.start.column',
    endLine = 'message[0].loc.end.line',
    endColumn = 'message[0].loc.end.column',
    message = '${message[0].descr} [flow]',
    security = 'level',
  },
  securities = {error = 'error', warning = 'warning'},
  rootPatterns = {'.flowconfig', '.git'},
}
