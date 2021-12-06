local fs = require('diagnosticls-configs.fs')

return {
  sourceName = 'stylua',
  command = fs.executable('stylua'),
  args = { '--color', 'Never', '-' },
  requiredFiles = { 'stylua.toml', '.stylua.toml' },
  rootPatterns = { 'stylua.toml', '.stylua.toml' },
}
