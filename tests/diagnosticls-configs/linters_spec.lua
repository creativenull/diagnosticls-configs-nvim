describe('Linter Configurations -', function()
  local linters = {
    'cpplint',
    'eslint',
    'eslint_d',
    'flake8',
    'flow',
    'golangci_lint',
    'languagetool',
    'luacheck',
    'phpcs',
    'phpstan',
    'psalm',
    'pylint',
    'reek',
    'revive',
    'rubocop',
    'shellcheck',
    'standard',
    'stylelint',
    'swiftlint',
    'ts_standard',
    'vint',
    'xo',
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
  for _, linter in pairs(linters) do
    it(string.format('Assert %q formatter', linter), function()
      local lint_config = require('diagnosticls-configs.linters.' .. linter)
      assert.has_no.errors(function()
        assert_config(lint_config)
      end)
    end)
  end
end)
