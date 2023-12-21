local function get_files()
  local fs = require('diagnosticls-configs.fs')
  local path = fs.get_plugin_path() .. '/lua/diagnosticls-configs/linters'
  local entries = vim.fn.readdir(path, function(_, value)
    return vim.fn.isdirectory(value) == 0
  end)

  return vim.tbl_map(function(value)
    return vim.split(value, '.', { plain = true })[1]
  end, entries)
end

describe('Linter Configurations -', function()
  local linters = get_files()

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
  for _, linter in pairs(linters) do
    it(string.format('Assert %q linter', linter), function()
      local lint_config = require('diagnosticls-configs.linters.' .. linter)
      assert.has_no.errors(function()
        assert_config(lint_config)
      end)
    end)
  end
end)
