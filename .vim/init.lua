-- Powered by projectlocal-vim
-- https://github.com/creativenull/projectlocal-vim
local ok, dls = pcall(require, 'diagnosticls-configs')
if ok then
  dls.setup({
    lua = {
      linter = require('diagnosticls-configs.linters.luacheck'),
      formatter = require('diagnosticls-configs.formatters.stylua'),
    },
  })
end
