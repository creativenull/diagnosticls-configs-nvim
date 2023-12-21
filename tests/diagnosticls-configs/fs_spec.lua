describe('FS module -', function()
  local fs = require('diagnosticls-configs.fs')

  it('Should provide executable path', function()
    assert.is_true(vim.endswith(fs.executable('prettier', fs.Scope.NODE), 'prettier'))
  end)

  it('Should provide plugin path', function()
    local dls_path = fs.get_plugin_path()
    assert.is_true(vim.endswith(dls_path, 'diagnosticls-configs-nvim'))
  end)
end)
