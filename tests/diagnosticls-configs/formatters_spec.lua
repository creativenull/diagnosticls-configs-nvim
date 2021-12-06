describe('Formatter Configurations -', function()
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

  -- autopep8
  it('Assert "autopep8" formatter', function()
    local autopep8 = require('diagnosticls-configs.formatters.autopep8')
    assert.has_no.errors(function()
      assert_config(autopep8)
    end)
  end)

  -- black
  it('Assert "black" formatter', function()
    local black = require('diagnosticls-configs.formatters.black')
    assert.has_no.errors(function()
      assert_config(black)
    end)
  end)

  -- eslint_d_fmt
  it('Assert "eslint_d_fmt" formatter', function()
    local eslint_d_fmt = require('diagnosticls-configs.formatters.eslint_d_fmt')
    assert.has_no.errors(function()
      assert_config(eslint_d_fmt)
    end)
  end)

  -- eslint_fmt
  it('Assert "eslint_fmt" formatter', function()
    local eslint_fmt = require('diagnosticls-configs.formatters.eslint_fmt')
    assert.has_no.errors(function()
      assert_config(eslint_fmt)
    end)
  end)

  -- gofumpt
  it('Assert "gofumpt" formatter', function()
    local gofumpt = require('diagnosticls-configs.formatters.gofumpt')
    assert.has_no.errors(function()
      assert_config(gofumpt)
    end)
  end)

  -- lua_format
  it('Assert "lua_format" formatter', function()
    local lua_format = require('diagnosticls-configs.formatters.lua_format')
    assert.has_no.errors(function()
      assert_config(lua_format)
    end)
  end)

  -- phpcbf
  it('Assert "phpcbf" formatter', function()
    local phpcbf = require('diagnosticls-configs.formatters.phpcbf')
    assert.has_no.errors(function()
      assert_config(phpcbf)
    end)
  end)

  -- prettier
  it('Assert "prettier" formatter', function()
    local prettier = require('diagnosticls-configs.formatters.prettier')
    assert.has_no.errors(function()
      assert_config(prettier)
    end)
  end)

  -- prettier_eslint
  it('Assert "prettier_eslint" formatter', function()
    local prettier_eslint = require('diagnosticls-configs.formatters.prettier_eslint')
    assert.has_no.errors(function()
      assert_config(prettier_eslint)
    end)
  end)

  -- prettier_standard
  it('Assert "prettier_standard" formatter', function()
    local prettier_standard = require('diagnosticls-configs.formatters.prettier_standard')
    assert.has_no.errors(function()
      assert_config(prettier_standard)
    end)
  end)

  -- standard_fmt
  it('Assert "standard_fmt" formatter', function()
    local standard_fmt = require('diagnosticls-configs.formatters.standard_fmt')
    assert.has_no.errors(function()
      assert_config(standard_fmt)
    end)
  end)

  -- stylua
  it('Assert "stylua" formatter', function()
    local stylua = require('diagnosticls-configs.formatters.stylua')
    assert.has_no.errors(function()
      assert_config(stylua)
    end)
  end)

  -- ts_standard_fmt
  it('Assert "ts_standard_fmt" formatter', function()
    local ts_standard_fmt = require('diagnosticls-configs.formatters.ts_standard_fmt')
    assert.has_no.errors(function()
      assert_config(ts_standard_fmt)
    end)
  end)

  -- xo_fmt
  it('Assert "xo_fmt" formatter', function()
    local xo_fmt = require('diagnosticls-configs.formatters.xo_fmt')
    assert.has_no.errors(function()
      assert_config(xo_fmt)
    end)
  end)
end)
