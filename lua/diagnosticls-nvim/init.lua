local utils = require 'diagnosticls-nvim.utils'
local M = {}

local diagnosticls_nvim_lsp_opts = {}

M.init = function(lsp_opts)
  diagnosticls_nvim_lsp_opts = lsp_opts
end

M.setup = function(opts)
  local filetypes = {}
  local lsp_opts = diagnosticls_nvim_lsp_opts
  local setup_opts = {
    init_options = {
      filetypes = {},
      formatFiletypes = {},
      linters = utils.get_linters(),
      formatters = utils.get_formatters(),
    },
  }

  -- Extend from setup()
  setup_opts = vim.tbl_extend('force', lsp_opts, setup_opts)

  for k1,v1 in pairs(opts) do
    table.insert(filetypes, k1)

    for k2,v2 in pairs(v1) do
      if k2 == 'linter' then
        setup_opts.init_options.filetypes[k1] = v2
      end

      if k2 == 'formatter' then
        setup_opts.init_options.formatFiletypes[k1] = v2
      end
    end
  end

  -- Add filetypes
  setup_opts.filetypes = filetypes

  require 'lspconfig'.diagnosticls.setup(setup_opts)
end

return M
