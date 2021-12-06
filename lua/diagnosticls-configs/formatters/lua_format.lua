local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'lua_format',
  command = fs.executable('lua-format'),
  args = { '%filepath' },
  rootPatterns = { '.lua-format' },
}
