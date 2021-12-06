describe('DiagnosticLS Formatters Setup -', function()
  local add_formatter = require('diagnosticls-configs.formatter').add_formatter
  local add_formatters = require('diagnosticls-configs.formatter').add_formatters
  local filetype = 'javascript'

  it('Assert add_formatter()', function()
    local prettier = {
      sourceName = 'prettier',
      command = 'formatterCmd',
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

    add_formatter(dls_setup, filetype, prettier)

    assert.are.same({
      filetypes = {},
      init_options = {
        filetypes = {},
        formatFiletypes = {
          javascript = 'prettier',
        },
        linters = {},
        formatters = {
          prettier = prettier,
        },
      },
    }, dls_setup)
  end)

  it('Assert add_formatters()', function()
    local prettier1 = {
      sourceName = 'prettier1',
      command = 'formatterCmd',
      args = {},
    }
    local prettier2 = {
      sourceName = 'prettier2',
      command = 'formatterCmd',
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

    add_formatters(dls_setup, filetype, { prettier1, prettier2 })

    assert.are.same({
      filetypes = {},
      init_options = {
        filetypes = {},
        formatFiletypes = {
          javascript = { 'prettier1', 'prettier2' },
        },
        linters = {},
        formatters = {
          prettier1 = prettier1,
          prettier2 = prettier2,
        },
      },
    }, dls_setup)
  end)
end)
