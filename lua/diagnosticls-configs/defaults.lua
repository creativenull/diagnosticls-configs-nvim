-- Defaults as defined in: supported-linters-and-formatters.md
return {
  ['css'] = {
    linters = { require('diagnosticls-configs.linters.stylelint') },
    formatters = { require('diagnosticls-configs.formatters.prettier') },
  },
  ['go'] = { linters = { require('diagnosticls-configs.linters.golangci_lint') } },
  ['html'] = { linters = { require('diagnosticls-configs.linters.stylelint') } },
  ['javascript'] = {
    linters = { require('diagnosticls-configs.linters.eslint') },
    formatters = { require('diagnosticls-configs.formatters.prettier') },
  },
  ['javascriptreact'] = {
    linters = { require('diagnosticls-configs.linters.eslint') },
    formatters = { require('diagnosticls-configs.formatters.prettier') },
  },
  ['less'] = {
    linters = { require('diagnosticls-configs.linters.stylelint') },
    formatters = { require('diagnosticls-configs.formatters.prettier') },
  },
  ['lua'] = {
    linters = { require('diagnosticls-configs.linters.luacheck') },
    formatters = { require('diagnosticls-configs.formatters.stylua') },
  },
  ['perl'] = {
    linters = { require('diagnosticls-configs.linters.perlcritic') },
    formatters = { require('diagnosticls-configs.formatters.perltidy') },
  },
  ['php'] = {
    linters = { require('diagnosticls-configs.linters.phpcs') },
    formatters = { require('diagnosticls-configs.formatters.phpcbf') },
  },
  ['python'] = {
    linters = { require('diagnosticls-configs.linters.flake8') },
    formatters = { require('diagnosticls-configs.formatters.autopep8') },
  },
  ['ruby'] = { linters = { require('diagnosticls-configs.linters.reek') } },
  ['sass'] = {
    linters = { require('diagnosticls-configs.linters.stylelint') },
    formatters = { require('diagnosticls-configs.formatters.prettier') },
  },
  ['scss'] = {
    linters = { require('diagnosticls-configs.linters.stylelint') },
    formatters = { require('diagnosticls-configs.formatters.prettier') },
  },
  ['swift'] = { linters = { require('diagnosticls-configs.linters.swiftlint') } },
  ['typescript'] = {
    linters = { require('diagnosticls-configs.linters.eslint') },
    formatters = { require('diagnosticls-configs.formatters.prettier') },
  },
  ['typescriptreact'] = {
    linters = { require('diagnosticls-configs.linters.eslint') },
    formatters = { require('diagnosticls-configs.formatters.prettier') },
  },
  ['vim'] = { linters = { require('diagnosticls-configs.linters.vint') } },
}
