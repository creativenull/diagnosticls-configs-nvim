# diagnosticls-configs-nvim (Status: Alpha)

> BREAKING CHANGES: This plugin name has changed from `diagnosticls-nvim` to `diagnosticls-configs-nvim`. Please update
  your plugin manager with the new name, along with your configurations moving the `require()` from
  `require('diagnosticls-nvim')` to `require('diagnosticls-configs')`

A collection of linters and formatters configured for [diagnostic language server][dls] to work with [nvim-lsp][lsp].
Have a look at the currently [supported linters/formatters](#supported-linters-and-formatters) below.

# TODO

+ [X] Add ability to override args, root patterns, etc
+ [X] Add vim docs
+ [ ] Add feature to allow multiple linters/formatters: [see ref](https://github.com/iamcco/diagnostic-languageserver#config--document)
+ [ ] Add contributing content

## Installation
### Requirements

+ Neovim v0.5 and up
+ Diagnostic Language Server, globally installed: `npm i -g diagnostic-languageserver`
+ `nvim-lspconfig`

You will need to install `diagnostic-languageserver` and `nvim-lspconfig` before using this plugin. Using
[packer.nvim][packer] as an example:

```lua
use {
  'creativenull/diagnosticls-configs-nvim',
  requires = { 'neovim/nvim-lspconfig' }
}
```

## Setup

First you need to initialize the plugin, this is where you can pass your own LSP options:

```lua
local function on_attach(client)
  print('Attached to ' .. client.name)
end

local dlsconfig = require 'diagnosticls-configs'

dlsconfig.init {
  on_attach = on_attach -- Your custom attach function
}
```

Finally, setup the linters/formatters according to the filetype, here is an example for running eslint and prettier
for `javascript` and `javascriptreact` filetype:

```lua
local eslint = require 'diagnosticls-configs.linters.eslint'
local prettier = require 'diagnosticls-configs.formatters.prettier'
dlsconfig.setup {
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
dlsconfig.init {
  default_config = true, --apply default config for supported linters and formatters
  format = true -- default to true, use false if you don't want to setup formatters by default
}
```

You still need to call the setup function.

If you wish to overwrite any of the default configuration
you can simply pass the parameters as described in the previous "Setup" section.

NOTE: The default formatters configuration won't enable "format on save".
You still need to setup that on your lsp on_attach handler.

## Advanced Configuration

If the default configuration do not work for certain linters/formatters, or root patterns need to be changed, etc.
Then you can overwrite the config by just extending them, the configs are exactly the same as the underlying
[diagnostic-languageserver API][dls-setup] on how to specify linter/formatter config. You can override with the
`vim.tbl_extend()` function.

```lua
local eslint = require 'diagnosticls-configs.linter.eslint'

-- override
eslint = vim.tbl_extend('force', eslint, {
  args = {'some', 'args'},
  rootPatterns = {'.git'}
})

dlsconfig.setup {
  javascript = {
    linter = eslint
  }
}
```

## Supported linters and formatters

Below are the supported linters and formatters that are configured to run with diagnostic-languageserver. Copy the
`require` code into your `setup()` function shown above.

+ CSS/SCSS/LESS
    + [`stylelint`][stylelint] => `require 'diagnosticls-configs.linters.stylelint'` --default
+ Go
    + _Linters_
        + [`golangci_lint`][golangci_lint] => `require 'diagnosticls-configs.linters.golangci_lint'` --default
        + [`revive`][revive] => `require 'diagnosticls-configs.linters.revive'`
    + _Formatters_
        + [`gofumpt`][gofumpt] => `require 'diagnosticls-configs.formatters.gofumpt'`
+ JavaScript
    + _Linters_
        + [`eslint`][eslint] => `require 'diagnosticls-configs.linters.eslint'` --default
        + [`standard`][standard] => `require 'diagnosticls-configs.linters.standard'`
        + [`xo`][xo] => `require 'diagnosticls-configs.linters.xo'`
    + _Formatters_
        + [`eslint_fmt`][eslint] => `require 'diagnosticls-configs.formatters.eslint_fmt'`
        + [`prettier_eslint`][prettier_eslint] => `require 'diagnosticls-configs.formatters.prettier_eslint'`
        + [`prettier_standard`][prettier_standard] => `require 'diagnosticls-configs.formatters.prettier_standard'`
        + [`prettier`][prettier] => `require 'diagnosticls-configs.formatters.prettier'` --default
        + [`standard_fmt`][standard] => `require 'diagnosticls-configs.formatters.standard_fmt'`
        + [`xo_fmt`][xo] => `require 'diagnosticls-configs.formatters.xo_fmt'`
+ Lua
    + _Linters_
        + [`luacheck`][luacheck] => `require 'diagnosticls-configs.linters.luacheck'` --default
    + _Formatters_
        + [`lua-format`][lua-format] => `require 'diagnosticls-configs.formatters.lua_format'` --default
+ PHP
    + [`phpcs`][phpcs] => `require 'diagnosticls-configs.linters.phpcs'` --default
    + [`phpstan`][phpstan] => `require 'diagnosticls-configs.linters.phpstan'`
    + [`psalm`][psalm] => `require 'diagnosticls-configs.linters.psalm'`
+ Python
    + _Linters_
        + [`flake`][flake] => `require 'diagnosticls-configs.linters.flake'` --default
        + [`pylint`][pylint] => `require 'diagnosticls-configs.linters.pylint'`
    + _Formatters_
        + [`autopep8`][autopep8] => `require 'diagnosticls-configs.formatters.autopep8'` --default
        + [`black`][black] => `require 'diagnosticls-configs.formatters.black'`
+ Ruby
    + [`reek`][reek] => `require 'diagnosticls-configs.linters.reek'` --default
    + [`rubocop`][rubocop] => `require 'diagnosticls-configs.linters.rubocop'`
+ TypeScript
    + _Linters_
        + [`eslint`][eslint] => `require 'diagnosticls-configs.linters.eslint'` --default
        + [`ts_standard`][ts_standard] => `require 'diagnosticls-configs.linters.ts_standard'`
        + [`xo`][xo] => `require 'diagnosticls-configs.linters.xo'`
    + _Formatters_
        + [`eslint_fmt`][eslint] => `require 'diagnosticls-configs.formatters.eslint_fmt'`
        + [`prettier_eslint`][prettier_eslint] => `require 'diagnosticls-configs.formatters.prettier_eslint'`
        + [`prettier`][prettier] => `require 'diagnosticls-configs.formatters.prettier'` --default
        + [`ts_standard_fmt`][ts_standard] => `require 'diagnosticls-configs.formatters.ts_standard_fmt'`
        + [`xo_fmt`][xo] => `require 'diagnosticls-configs.formatters.xo_fmt'`
+ Vim
    + [`vint`][vint] => `require 'diagnosticls-configs.linters.vint'` --default

## Contributing

Coming Soon

[dls]: https://github.com/iamcco/diagnostic-languageserver
[dls-setup]: https://github.com/iamcco/diagnostic-languageserver#config--document
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
[luacheck]: https://github.com/mpeterv/luacheck
[lua-format]: https://github.com/Koihik/LuaFormatter
