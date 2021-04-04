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

+ JavaScript
    + __Linters__
        + [`eslint`][eslint] => `require 'diagnosticls-nvim.linters.eslint'`
        + [`standard`][standard] => `require 'diagnosticls-nvim.linters.standard'`
        + [`xo`][xo] => `require 'diagnosticls-nvim.linters.xo'`
    + __Formatters__
        + [`prettier_eslint`][prettier_eslint] => `require 'diagnosticls-nvim.formatters.prettier_eslint'`
        + [`prettier_standard`][prettier_standard] => `require 'diagnosticls-nvim.formatters.prettier_standard'`
        + [`prettier`][prettier] => `require 'diagnosticls-nvim.formatters.prettier'`
        + [`standard_fmt`][standard] => `require 'diagnosticls-nvim.formatters.standard_fmt'`
        + [`xo_fmt`][xo] => `require 'diagnosticls-nvim.formatters.xo_fmt'`
+ TypeScript
    + __Linters__
        + [`eslint`][eslint] => `require 'diagnosticls-nvim.linters.eslint'`
        + [`ts_standard`][ts_standard] => `require 'diagnosticls-nvim.linters.ts_standard'`
        + [`xo`][xo] => `require 'diagnosticls-nvim.linters.xo'`
    + __Formatters__
        + [`prettier_eslint`][prettier_eslint] => `require 'diagnosticls-nvim.formatters.prettier_eslint'`
        + [`prettier`][prettier] => `require 'diagnosticls-nvim.formatters.prettier'`
        + [`ts_standard_fmt`][ts_standard] => `require 'diagnosticls-nvim.formatters.ts_standard_fmt'`
        + [`xo_fmt`][xo_fmt] => `require 'diagnosticls-nvim.formatters.xo_fmt'`
+ Python
    + [`flake`][flake] => `require 'diagnosticls-nvim.linters.flake'`
    + [`pylint`][pylint] => `require 'diagnosticls-nvim.linters.pylint'`
+ Go
    + [`golangci_lint`][golangci_lint] => `require 'diagnosticls-nvim.linters.golangci_lint'`
    + [`revive`][revive] => `require 'diagnosticls-nvim.linters.revive'`
+ Ruby
    + [`reek`][reek] => `require 'diagnosticls-nvim.linters.reek'`
    + [`rubocop`][rubocop] => `require 'diagnosticls-nvim.linters.rubocop'`
+ CSS/SCSS/LESS
    + [`stylelint`][stylelint] => `require 'diagnosticls-nvim.linters.stylelint'`
+ PHP
    + [`phpcs`][phpcs] => `require 'diagnosticls-nvim.linters.phpcs'`
    + [`phpstan`][phpstan] => `require 'diagnosticls-nvim.linters.phpstan'`
    + [`psalm`][psalm] => `require 'diagnosticls-nvim.linters.psalm'`
+ Vim
    + [`vint`][vint] => `require 'diagnosticls-nvim.linters.vint'`

## Contributing

Coming Soon

[dls]: https://github.com/iamcco/diagnostic-languageserver
[lsp]: https://neovim.io/doc/user/lsp.html
[packer]: https://github.com/wbthomason/packer.nvim

[//]: # (Linters/Formatters list)
[eslint]: https://github.com/eslint/eslint
[flake]: https://github.com/PyCQA/flake8
[golangci_lint]: https://github.com/golangci/golangci-lint
[phpcs]: https://github.com/squizlabs/PHP_CodeSniffer
[phpstan]: https://github.com/phpstan/phpstan
[prettier]: https://github.com/prettier/prettier
[prettier_eslint]: https://github.com/prettier/prettier-eslint
[prettier_standard]: https://github.com/sheerun/prettier-standard
[psalm]: https://github.com/vimeo/psalm
[pylint]: https://github.com/PyCQA/pylint
[reek]: https://github.com/troessner/reek
[revive]: https://github.com/mgechev/revive
[rubocop]: https://github.com/rubocop/rubocop
[standard]: https://github.com/standard/standard
[stylelint]: https://github.com/stylelint/stylelint
[ts_standard]: https://github.com/standard/ts-standard
[vint]: https://github.com/Vimjas/vint
[xo]: https://github.com/xojs/xo
