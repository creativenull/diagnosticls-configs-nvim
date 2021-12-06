local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'deno',
  command = fs.executable('deno'),
  args = { 'fmt', '-' },
  isStdout = true,
  rootPatterns = {
    'deno.json',
    'deno.jsonc',
  },
}
