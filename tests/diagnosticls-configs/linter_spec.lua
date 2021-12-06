describe('DiagnosticLS Linters Setup', function()
  local add_linter = require('diagnosticls-configs.linter').add_linter
  local add_linters = require('diagnosticls-configs.linter').add_linters
  local filetype = 'javascript'

  it('Assert add_linter()', function()
    local eslint = {
      sourceName = 'eslint',
      command = 'linterCmd',
      args = {},
    }
    local dls_setup = {
      filetypes = {},
      init_options = {
        filetypes = {},
        formatFiletypes = {},
        linters = {},
        formatters = {},
      },
    }

    add_linter(dls_setup, filetype, eslint)

    assert.are.same({
      filetypes = {},
      init_options = {
        filetypes = {
          javascript = 'eslint',
        },
        formatFiletypes = {},
        linters = {
          eslint = eslint,
        },
        formatters = {},
      },
    }, dls_setup)
  end)

  it('Assert add_linters()', function()
    local eslint1 = {
      sourceName = 'eslint1',
      command = 'linterCmd',
      args = {},
    }
    local eslint2 = {
      sourceName = 'eslint2',
      command = 'linterCmd',
      args = {},
    }
    local dls_setup = {
      filetypes = {},
      init_options = {
        filetypes = {},
        formatFiletypes = {},
        linters = {},
        formatters = {},
      },
    }

    add_linters(dls_setup, filetype, { eslint1, eslint2 })

    assert.are.same({
      filetypes = {},
      init_options = {
        filetypes = {
          javascript = { 'eslint1', 'eslint2' },
        },
        formatFiletypes = {},
        linters = {
          eslint1 = eslint1,
          eslint2 = eslint2,
        },
        formatters = {},
      },
    }, dls_setup)
  end)
end)
