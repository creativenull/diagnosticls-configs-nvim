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

## Default configuration

A default configuration for the supported filetypes is provided but not activated by default.

To activate the default configuration you can pass the `default_config` flag as true in the init function:

```lua
require 'diagnosticls-nvim'.init {
  default_config = true, --apply default config for supported linters and formatters
  format = true -- default to true, use false if you don't want to setup formatters by default
}
```

You still need to call the setup function.

If you wish to overwrite any of the default configuration
you can simply pass the parameters as described in the previous "Setup" section.

NOTE: The default formatters configuration won't enable "format on save".
You still need to setup that on your lsp on_attach handler.


## Supported linters and formatters

Below are the supported linters and formatters that are configured to run with diagnostic-languageserver. Copy the
`require` code into your `setup()` function shown above.

+ JavaScript
    + _Linters_
        + [`eslint`][eslint] => `require 'diagnosticls-nvim.linters.eslint'` --default
        + [`standard`][standard] => `require 'diagnosticls-nvim.linters.standard'`
        + [`xo`][xo] => `require 'diagnosticls-nvim.linters.xo'`
    + _Formatters_
        + [`eslint_fmt`][eslint] => `require 'diagnosticls-nvim.formatters.eslint_fmt'`
        + [`prettier_eslint`][prettier_eslint] => `require 'diagnosticls-nvim.formatters.prettier_eslint'`
        + [`prettier_standard`][prettier_standard] => `require 'diagnosticls-nvim.formatters.prettier_standard'`
        + [`prettier`][prettier] => `require 'diagnosticls-nvim.formatters.prettier'` --default
        + [`standard_fmt`][standard] => `require 'diagnosticls-nvim.formatters.standard_fmt'`
        + [`xo_fmt`][xo] => `require 'diagnosticls-nvim.formatters.xo_fmt'`
+ TypeScript
    + _Linters_
        + [`eslint`][eslint] => `require 'diagnosticls-nvim.linters.eslint'` --default
        + [`ts_standard`][ts_standard] => `require 'diagnosticls-nvim.linters.ts_standard'`
        + [`xo`][xo] => `require 'diagnosticls-nvim.linters.xo'`
    + _Formatters_
        + [`eslint_fmt`][eslint] => `require 'diagnosticls-nvim.formatters.eslint_fmt'`
        + [`prettier_eslint`][prettier_eslint] => `require 'diagnosticls-nvim.formatters.prettier_eslint'`
        + [`prettier`][prettier] => `require 'diagnosticls-nvim.formatters.prettier'` --default
        + [`ts_standard_fmt`][ts_standard] => `require 'diagnosticls-nvim.formatters.ts_standard_fmt'`
        + [`xo_fmt`][xo] => `require 'diagnosticls-nvim.formatters.xo_fmt'`
+ Python
    + _Linters_
        + [`flake`][flake] => `require 'diagnosticls-nvim.linters.flake'` --default
        + [`pylint`][pylint] => `require 'diagnosticls-nvim.linters.pylint'`
    + _Formatters_
        + [`autopep8`][autopep8] => `require 'diagnosticls-nvim.formatters.autopep8'` --default
        + [`black`][black] => `require 'diagnosticls-nvim.formatters.black'`
+ Go
    + _Linters_
        + [`golangci_lint`][golangci_lint] => `require 'diagnosticls-nvim.linters.golangci_lint'` --default
        + [`revive`][revive] => `require 'diagnosticls-nvim.linters.revive'`
    + _Formatters_
        + [`gofumpt`][gofumpt] => `require 'diagnosticls-nvim.formatters.gofumpt'`
+ Ruby
    + [`reek`][reek] => `require 'diagnosticls-nvim.linters.reek'` --default
    + [`rubocop`][rubocop] => `require 'diagnosticls-nvim.linters.rubocop'`
+ CSS/SCSS/LESS
    + [`stylelint`][stylelint] => `require 'diagnosticls-nvim.linters.stylelint'` --default
+ PHP
    + [`phpcs`][phpcs] => `require 'diagnosticls-nvim.linters.phpcs'` --default
    + [`phpstan`][phpstan] => `require 'diagnosticls-nvim.linters.phpstan'`
    + [`psalm`][psalm] => `require 'diagnosticls-nvim.linters.psalm'`
+ Vim
    + [`vint`][vint] => `require 'diagnosticls-nvim.linters.vint'` --default

## Contributing

Coming Soon

[dls]: https://github.com/iamcco/diagnostic-languageserver
[lsp]: https://neovim.io/doc/user/lsp.html
[packer]: https://github.com/wbthomason/packer.nvim

[//]: # (Linters/Formatters list)
[autopep8]: https://github.com/hhatto/autopep8
[black]: https://github.com/psf/black
[eslint]: https://github.com/eslint/eslint
[flake]: https://github.com/PyCQA/flake8
[gofumpt]: https://github.com/mvdan/gofumpt
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
