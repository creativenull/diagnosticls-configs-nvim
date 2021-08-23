local M = {}

function M.extendconfig(default_config, override)
  return vim.tbl_extend('force', default_config, override)
end

return M
