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

require 'diagnosticls-nvim'.init {
  on_attach = on_attach -- Your custom attach function
}
```

Finally, setup the linters/formatters according to the filetype, here is an example for running eslint and prettier
for `javascript` and `javascriptreact` filetype:

```lua
local eslint = require 'diagnosticls-nvim.linters.eslint'
local prettier = require 'diagnosticls-nvim.formatters.prettier'
require 'diagnosticls-nvim'.setup {
  ['javascript'] = {
    linter = eslint,
    formatter = prettier
  },
  ['javascriptreact'] = {
    linter = eslint,
    formatter = prettier
  }
}
```

## Supported linters and formatters

Below are the supported linters and formatters that are configured to run with diagnostic-languageserver. Copy the
`require` code into your `setup()` function shown above.

### Linters

+ `eslint` => `require 'diagnosticls-nvim.linters.eslint'`
+ `flake` => `require 'diagnosticls-nvim.linters.flake'`
+ `golangci_lint` => `require 'diagnosticls-nvim.linters.golangci_lint'`
+ `phpcs` => `require 'diagnosticls-nvim.linters.phpcs'`
+ `phpstan` => `require 'diagnosticls-nvim.linters.phpstan'`
+ `psalm` => `require 'diagnosticls-nvim.linters.psalm'`
+ `pylint` => `require 'diagnosticls-nvim.linters.pylint'`
+ `reek` => `require 'diagnosticls-nvim.linters.reek'`
+ `revive` => `require 'diagnosticls-nvim.linters.revive'`
+ `rubocop` => `require 'diagnosticls-nvim.linters.rubocop'`
+ `standard` => `require 'diagnosticls-nvim.linters.standard'`
+ `stylelint` => `require 'diagnosticls-nvim.linters.stylelint'`
+ `ts_standard` => `require 'diagnosticls-nvim.linters.ts_standard'`
+ `vint` => `require 'diagnosticls-nvim.linters.vint'`
+ `xo` => `require 'diagnosticls-nvim.linters.xo'`

### Formatters

+ `prettier_eslint` => `require 'diagnosticls-nvim.formatters.prettier_eslint'`
+ `prettier_standard` => `require 'diagnosticls-nvim.formatters.prettier_standard'`
+ `prettier` => `require 'diagnosticls-nvim.formatters.prettier'`
+ `standard_fmt` => `require 'diagnosticls-nvim.formatters.standard_fmt'`
+ `ts_standard_fmt` => `require 'diagnosticls-nvim.formatters.ts_standard_fmt'`
+ `xo_fmt` => `require 'diagnosticls-nvim.formatters.xo_fmt'`

[dls]: https://github.com/iamcco/diagnostic-languageserver
[lsp]: https://neovim.io/doc/user/lsp.html
[packer]: https://github.com/wbthomason/packer.nvim
