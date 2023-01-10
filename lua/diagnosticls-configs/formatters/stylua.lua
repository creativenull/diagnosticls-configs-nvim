local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'stylua',
  command = fs.executable('stylua'),
  args = { '--color', 'Never', '-' },
  rootPatterns = { 'stylua.toml', '.stylua.toml' },
}
