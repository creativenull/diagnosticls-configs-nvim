local lspconfig = require 'lspconfig'
local M = {}

local diagnosticls_nvim_lsp_opts = {
  root_dir = require'lspconfig'.util.root_pattern('.git'),
  default_config = false,
  format = true,
}

local diagnosticls_nvim_defaults = {
  ['css'] = {linter = require 'diagnosticls-nvim.linters.stylelint'},
  ['go'] = {linter = require 'diagnosticls-nvim.linters.golangci_lint'},
  ['html'] = {linter = require 'diagnosticls-nvim.linters.stylelint'},
  ['javascript'] = {
    linter = require 'diagnosticls-nvim.linters.eslint',
    formatter = require 'diagnosticls-nvim.formatters.prettier',
  },
  ['javascriptreact'] = {
    linter = require 'diagnosticls-nvim.linters.eslint',
    formatter = require 'diagnosticls-nvim.formatters.prettier',
  },
  ['less'] = {linter = require 'diagnosticls-nvim.linters.stylelint'},
  ['lua'] = {
    linter = require 'diagnosticls-nvim.linters.luacheck',
    formatter = require 'diagnosticls-nvim.formatters.lua_format',
  },
  ['php'] = {linter = require 'diagnosticls-nvim.linters.phpcs'},
  ['python'] = {
    linter = require 'diagnosticls-nvim.linters.flake8',
    formatter = require 'diagnosticls-nvim.formatters.autopep8',
  },
  ['ruby'] = {linter = require 'diagnosticls-nvim.linters.reek'},
  ['typescript'] = {
    linter = require 'diagnosticls-nvim.linters.eslint',
    formatter = require 'diagnosticls-nvim.formatters.prettier',
  },
  ['typescriptreact'] = {
    linter = require 'diagnosticls-nvim.linters.eslint',
    formatter = require 'diagnosticls-nvim.formatters.prettier',
  },
  ['vim'] = {linter = require 'diagnosticls-nvim.linters.vint'},
}

-- Initialize lsp options to pass thru diagnosticls
-- @param lsp_opts table
-- @return void
M.init = function(lsp_opts)
  diagnosticls_nvim_lsp_opts = vim.tbl_extend('force',
                                              diagnosticls_nvim_lsp_opts,
                                              lsp_opts)
end

-- Setup the linter and/or formatter based on the filetype
-- @param opts table
-- @return void
M.setup = function(opts)
  local filetypes = {}
  local lsp_opts = diagnosticls_nvim_lsp_opts
  local setup_opts = {
    filetypes = {},
    init_options = {
      filetypes = {},
      formatFiletypes = {},
      linters = {},
      formatters = {},
    },
  }

  -- Extend from setup()
  setup_opts = vim.tbl_extend('force', lsp_opts, setup_opts)

  if (setup_opts.default_config) then
    opts = vim.tbl_extend('force', diagnosticls_nvim_defaults, opts)
  end

  for k1, v1 in pairs(opts) do

    -- Start adding to opts
    table.insert(filetypes, k1)

    for k2, v2 in pairs(v1) do
      if k2 == 'linter' then
        local source_name = v2['sourceName']
        setup_opts.init_options.filetypes[k1] = source_name
        setup_opts.init_options.linters[source_name] = v2
      end

      if k2 == 'formatter' and lsp_opts.format then
        -- diagnosticls formatters don't have the sourceName key
        -- so this is a custom key used only for this plugin
        local source_name = v2['sourceName']
        setup_opts.init_options.formatFiletypes[k1] = source_name
        setup_opts.init_options.formatters[source_name] = v2
      end
    end
  end

  setup_opts.filetypes = filetypes
  lspconfig.diagnosticls.setup(setup_opts)
end

return M
