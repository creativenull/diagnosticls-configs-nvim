describe('Formatter Configurations -', function()
  local formatters = {
    'autopep8',
    'black',
    'deno_fmt',
    'eslint_d_fmt',
    'eslint_fmt',
    'gofumpt',
    'lua_format',
    'phpcbf',
    'prettier',
    'prettier_eslint',
    'prettier_standard',
    'standard_fmt',
    'stylua',
    'swiftformat',
    'ts_standard_fmt',
    'xo_fmt',
  }

  local function assert_config(config)
    local is_non_empty_string = function(value)
      return type(value) == 'string' and value ~= ''
    end

    local is_non_empty_list = function(value)
      return vim.tbl_islist(value) and not vim.tbl_isempty(value)
    end

    vim.validate({
      sourceName = { config.sourceName, is_non_empty_string, 'non-empty string' },
      command = { config.command, is_non_empty_string, 'non-empty string' },
      args = { config.args, is_non_empty_list, 'non-empty list/table' },
    })
  end

  -- Start tests
  for _, formatter in pairs(formatters) do
    it(string.format('Assert %q formatter', formatter), function()
      local fmt_config = require('diagnosticls-configs.formatters.' .. formatter)
      assert.has_no.errors(function()
        assert_config(fmt_config)
      end)
    end)
  end
end)
