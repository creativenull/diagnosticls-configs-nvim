local function get_files()
  local fs = require('diagnosticls-configs.fs')
  local path = fs.get_plugin_path() .. '/lua/diagnosticls-configs/formatters'
  local entries = vim.fn.readdir(path, function(_, value)
    return vim.fn.isdirectory(value) == 0
  end)

  return vim.tbl_map(function(value)
    return vim.split(value, '.', { plain = true })[1]
  end, entries)
end

describe('Formatter Configurations -', function()
  local formatters = get_files()

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
