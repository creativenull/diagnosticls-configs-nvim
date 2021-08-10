local fs = require 'diagnosticls-configs.fs'

return {
  sourceName = 'phpstan',
  command = fs.get_executable('phpstan', 'php'),
  args = {'analyze', '--error-format', 'raw', '--no-progress', '%file'},
  debounce = 100,
  offsetLine = 0,
  offsetColumn = 0,
  formatLines = 1,
  formatPattern = {
    [[^[^:]+:(\d+):(.*)(\r|\n)*$]],
    {line = 1, message = {'[phpstan] ', 2}},
  },
  rootPatterns = {'.git', 'vendor', 'composer.json'},
}
