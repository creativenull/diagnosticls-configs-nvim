describe('Linter Configurations -', function()
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

  -- cpplint
  it('Assert "cpplint" linter', function()
    local cpplint = require('diagnosticls-configs.linters.cpplint')
    assert.has_no.errors(function()
      assert_config(cpplint)
    end)
  end)

  -- eslint
  it('Assert "eslint" linter', function()
    local eslint = require('diagnosticls-configs.linters.eslint')
    assert.has_no.errors(function()
      assert_config(eslint)
    end)
  end)

  -- eslint_d
  it('Assert "eslint_d" linter', function()
    local eslint_d = require('diagnosticls-configs.linters.eslint_d')
    assert.has_no.errors(function()
      assert_config(eslint_d)
    end)
  end)

  -- flake8
  it('Assert "flake8" linter', function()
    local flake8 = require('diagnosticls-configs.linters.flake8')
    assert.has_no.errors(function()
      assert_config(flake8)
    end)
  end)

  -- flow
  it('Assert "flow" linter', function()
    local flow = require('diagnosticls-configs.linters.flow')
    assert.has_no.errors(function()
      assert_config(flow)
    end)
  end)

  -- golangci_lint
  it('Assert "golangci_lint" linter', function()
    local golangci_lint = require('diagnosticls-configs.linters.golangci_lint')
    assert.has_no.errors(function()
      assert_config(golangci_lint)
    end)
  end)

  -- languagetool
  it('Assert "languagetool" linter', function()
    local languagetool = require('diagnosticls-configs.linters.languagetool')
    assert.has_no.errors(function()
      assert_config(languagetool)
    end)
  end)

  -- luacheck
  it('Assert "luacheck" linter', function()
    local luacheck = require('diagnosticls-configs.linters.luacheck')
    assert.has_no.errors(function()
      assert_config(luacheck)
    end)
  end)

  -- phpcs
  it('Assert "phpcs" linter', function()
    local phpcs = require('diagnosticls-configs.linters.phpcs')
    assert.has_no.errors(function()
      assert_config(phpcs)
    end)
  end)

  -- phpstan
  it('Assert "phpstan" linter', function()
    local phpstan = require('diagnosticls-configs.linters.phpstan')
    assert.has_no.errors(function()
      assert_config(phpstan)
    end)
  end)

  -- psalm
  it('Assert "psalm" linter', function()
    local psalm = require('diagnosticls-configs.linters.psalm')
    assert.has_no.errors(function()
      assert_config(psalm)
    end)
  end)

  -- pylint
  it('Assert "pylint" linter', function()
    local pylint = require('diagnosticls-configs.linters.pylint')
    assert.has_no.errors(function()
      assert_config(pylint)
    end)
  end)

  -- reek
  it('Assert "reek" linter', function()
    local reek = require('diagnosticls-configs.linters.reek')
    assert.has_no.errors(function()
      assert_config(reek)
    end)
  end)

  -- revive
  it('Assert "revive" linter', function()
    local revive = require('diagnosticls-configs.linters.revive')
    assert.has_no.errors(function()
      assert_config(revive)
    end)
  end)

  -- rubocop
  it('Assert "rubocop" linter', function()
    local rubocop = require('diagnosticls-configs.linters.rubocop')
    assert.has_no.errors(function()
      assert_config(rubocop)
    end)
  end)

  -- shellcheck
  it('Assert "shellcheck" linter', function()
    local shellcheck = require('diagnosticls-configs.linters.shellcheck')
    assert.has_no.errors(function()
      assert_config(shellcheck)
    end)
  end)

  -- standard
  it('Assert "standard" linter', function()
    local standard = require('diagnosticls-configs.linters.standard')
    assert.has_no.errors(function()
      assert_config(standard)
    end)
  end)

  -- stylelint
  it('Assert "stylelint" linter', function()
    local stylelint = require('diagnosticls-configs.linters.stylelint')
    assert.has_no.errors(function()
      assert_config(stylelint)
    end)
  end)

  -- swiftlint
  it('Assert "swiftlint" linter', function()
    local swiftlint = require('diagnosticls-configs.linters.swiftlint')
    assert.has_no.errors(function()
      assert_config(swiftlint)
    end)
  end)

  -- ts_standard
  it('Assert "ts_standard" linter', function()
    local ts_standard = require('diagnosticls-configs.linters.ts_standard')
    assert.has_no.errors(function()
      assert_config(ts_standard)
    end)
  end)

  -- vint
  it('Assert "vint" linter', function()
    local vint = require('diagnosticls-configs.linters.vint')
    assert.has_no.errors(function()
      assert_config(vint)
    end)
  end)

  -- xo
  it('Assert "xo" linter', function()
    local xo = require('diagnosticls-configs.linters.xo')
    assert.has_no.errors(function()
      assert_config(xo)
    end)
  end)
end)
