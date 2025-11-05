local M = {}

local function has_linter(lang_option)
  return lang_option.linters ~= nil and vim.islist(lang_option.linters)
end

local function has_formatter(lang_option)
  return lang_option.formatters ~= nil and vim.islist(lang_option.formatters)
end

local function create_init_options(options)
  local init_options = {
    linters = {},
    filetypes = {},
    formatters = {},
    formatFiletypes = {},
  }

  for filetype, opt in pairs(options) do
    if has_linter(opt) then
      for _, linter in pairs(opt.linters) do
        local linter_name = linter.sourceName

        init_options.linters[linter_name] = linter

        if init_options.filetypes[filetype] == nil then
          init_options.filetypes[filetype] = {}
        end

        table.insert(init_options.filetypes[filetype], linter_name)
      end
    end

    if has_formatter(opt) then
      for _, formatter in pairs(opt.formatters) do
        local formatter_name = formatter.sourceName

        init_options.formatters[formatter_name] = formatter

        if init_options.formatFiletypes[filetype] == nil then
          init_options.formatFiletypes[filetype] = {}
        end

        table.insert(init_options.formatFiletypes[filetype], formatter_name)
      end
    end
  end

  return init_options
end

---@param options table
---@return table
function M.create(options)
  if options == nil then
    return {}
  end

  local lsp_config = {
    filetypes = vim.tbl_keys(options),
    init_options = create_init_options(options),
  }

  return lsp_config
end

---@param extended_options table
---@return table
function M.defaults(extended_options)
  local options = require('diagnosticls-configs.defaults')

  if extended_options ~= nil and type(extended_options) == 'table' then
    options = vim.tbl_deep_extend('force', options, extended_options)
  end

  local lsp_config = {
    filetypes = vim.tbl_keys(options),
    init_options = create_init_options(options),
  }

  return lsp_config
end

return M
