local fs = require 'diagnosticls-configs.fs'

return {
  sourceName = 'languagetool',
  command = fs.get_executable('languagetool'),
  debounce = 200,
  args = {'-'},
  offsetLine = 0,
  offsetColumn = 0,
  formatLines = 2,
  formatPattern = {
    [[^\d+?\.\)\s+Line\s+(\d+),\s+column\s+(\d+),\s+([^\n]+)\nMessage:\s+(.*)(\r|\n)*$]],
    {
      line = 1,
      column = 2,
      message = {4, 3},
    },
  },
  rootPatterns = {'.git'},
}
