# diagnosticls-nvim (Status: Experimental)

A collection of linters and formatters configured for [diagnostic language server][dls] to work with [nvim-lsp][lsp].
Have a look at the currently [supported linters/formatters](#supported-linters-and-formatters) below.

## Installation
### Requirements

+ Neovim v0.5
+ DiagnosticLS, globally installed: `npm i -g diagnostic-languageserver`
+ `nvim-lspconfig`

You will need to install `diagnostic-languageserver` and `nvim-lspconfig` before using this plugin. Using
[packer.nvim][packer] as an example:

```lua
use {
  'creativenull/diagnosticls-nvim',
  requires = { 'neovim/nvim-lspconfig' }
}
```

## Setup

First you need to initialize the plugin, this is where you can pass your own LSP options:

```lua
local function on_attach(client)
  print('Attached to ' .. client.name)
end

require'diagnosticls-nvim'.init {
  on_attach = on_attach, -- Custom attach function
  root_dir = require'lspconfig'.util.root_pattern('.git')
}
```

Finally, setup the linters/formatters according to the filetype, here is an example for running eslint and prettier
for `javascript` and `javascriptreact` filetype:

```lua
require'diagnosticls-nvim'.setup {
  javascript = {
    linter = 'eslint',
    formatter = 'prettier'
  },
  javascriptreact = {
    linter = 'eslint',
    formatter = 'prettier'
  }
}
```

## Supported linters and formatters

### Linters

+ `eslint`
+ `flake`
+ `golangci_lint`
+ `phpcs`
+ `phpstan`
+ `psalm`
+ `pylint`
+ `reek`
+ `revive`
+ `rubocop`
+ `standard`
+ `stylelint`
+ `ts_standard`
+ `vint`
+ `xo`

### Formatters

+ `prettier_eslint`
+ `prettier_standard`
+ `prettier`
+ `standard_fmt`
+ `ts_standard_fmt`
+ `xo_fmt`

[dls]: https://github.com/iamcco/diagnostic-languageserver
[lsp]: https://neovim.io/doc/user/lsp.html
[packer]: https://github.com/wbthomason/packer.nvim
