local lspconfig = require 'lspconfig'
local M = {}

local diagnosticls_nvim_lsp_opts = {
  root_dir = require'lspconfig'.util.root_pattern('.git'),
  default_config = false,
  format = true,
}

local diagnosticls_nvim_defaults = {
  ['css'] = {linter = require 'diagnosticls-configs.linters.stylelint'},
  ['go'] = {linter = require 'diagnosticls-configs.linters.golangci_lint'},
  ['html'] = {linter = require 'diagnosticls-configs.linters.stylelint'},
  ['javascript'] = {
    linter = require 'diagnosticls-configs.linters.eslint',
    formatter = require 'diagnosticls-configs.formatters.prettier',
  },
  ['javascriptreact'] = {
    linter = require 'diagnosticls-configs.linters.eslint',
    formatter = require 'diagnosticls-configs.formatters.prettier',
  },
  ['less'] = {linter = require 'diagnosticls-configs.linters.stylelint'},
  ['lua'] = {
    linter = require 'diagnosticls-configs.linters.luacheck',
    formatter = require 'diagnosticls-configs.formatters.lua_format',
  },
  ['php'] = {linter = require 'diagnosticls-configs.linters.phpcs'},
  ['python'] = {
    linter = require 'diagnosticls-configs.linters.flake8',
    formatter = require 'diagnosticls-configs.formatters.autopep8',
  },
  ['ruby'] = {linter = require 'diagnosticls-configs.linters.reek'},
  ['typescript'] = {
    linter = require 'diagnosticls-configs.linters.eslint',
    formatter = require 'diagnosticls-configs.formatters.prettier',
  },
  ['typescriptreact'] = {
    linter = require 'diagnosticls-configs.linters.eslint',
    formatter = require 'diagnosticls-configs.formatters.prettier',
  },
  ['vim'] = {linter = require 'diagnosticls-configs.linters.vint'},
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

  for filetype,config_types in pairs(opts) do
    -- Start adding to opts
    table.insert(filetypes, filetype)

    for config_type,config in pairs(config_types) do
      if config_type == 'linter' then

        if vim.tbl_islist(config) then
          local sources = {}
          for _,config_source in pairs(config) do
            local source_name = config_source['sourceName']
            table.insert(sources, source_name)
            setup_opts.init_options.linters[source_name] = config_source
          end
          setup_opts.init_options.filetypes[filetype] = sources
        else
          local source_name = config['sourceName']
          setup_opts.init_options.linters[source_name] = config
          setup_opts.init_options.filetypes[filetype] = source_name
        end

      end

      if config_type == 'formatter' and lsp_opts.format then

        -- diagnosticls formatters don't have the sourceName key
        -- so this is a custom key used only for this plugin
        if vim.tbl_islist(config) then
          local sources = {}
          for _,config_source in pairs(config) do
            local source_name = config_source['sourceName']
            table.insert(sources, source_name)
            setup_opts.init_options.formatters[source_name] = config_source
          end
          setup_opts.init_options.formatFiletypes[filetype] = sources
        else
          local source_name = config['sourceName']
          setup_opts.init_options.formatters[source_name] = config
          setup_opts.init_options.formatFiletypes[filetype] = source_name
        end

      end
    end
  end

  setup_opts.filetypes = filetypes
  lspconfig.diagnosticls.setup(setup_opts)
end

return M
