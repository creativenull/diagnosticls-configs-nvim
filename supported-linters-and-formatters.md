# Supported Linters and Formatters

Please create an Pull Request if you see any mismatched documentation or typos.

## Default Configurations

Here is a list of languages that are automatically set and configured when `default_config` is set. For information
on how to set `default_config` check the docs:
[`:help diagnosticls-configs-defaults`](https://github.com/creativenull/diagnosticls-configs-nvim#default-configuration).

| **Filetype** | **Default Linter** | **Default Formatter** |
|--------------|--------------------|-----------------------|
| CSS/SASS/SCSS/LESS | [`stylelint`](#csssassscssless) | [`prettier`](#csssassscssless) |
| Go | [`golangci_lint`](#go) | |
| HTML | [`stylelint`](#html) | [`prettier`](#html) |
| JavaScript/JSX | [`eslint`](#javascript) | [`prettier`](#javascript) |
| Lua | [`luacheck`](#lua) | [`stylua`](#lua) |
| PHP | [`phpcs`](#php) | [`phpcbf`](#php) |
| Python | [`flake8`](#python) | [`autopep8`](#python) |
| Ruby | [`reek`](#ruby) | |
| Swift | [`swiftlint`](#swift) | |
| TypeScript/TSX | [`eslint`](#typescript) | [`prettier`](#typescript) |
| Vim | [`vint`](#vim) | |

## Linter/Formatter Configurations

Below are the supported linters and formatters that are configured to run with diagnostic-languageserver. You can access
the table of contents of this document on the left hand corner of the file, in github. Copy the `require` code into your
`setup()` function (See example code:
[`:help diagnosticls-configs-setup`](https://github.com/creativenull/diagnosticls-configs-nvim#setup)).

### CSS/SASS/SCSS/LESS
#### Linters

[stylelint][stylelint]

```lua
local stylelint = require 'diagnosticls-configs.linters.stylelint'
```

#### Formatters

[prettier][prettier]

```lua
local prettier = require 'diagnosticls-configs.formatters.prettier'
```

### Go
#### Linters

[golangci_lint][golangci_lint]

```lua
local golangci_lint = require 'diagnosticls-configs.linters.golangci_lint'
```

[revive][revive]

```lua
local revive = require 'diagnosticls-configs.linters.revive'
```

#### Formatters

[gofumpt][gofumpt]

```lua
local gofumpt = require 'diagnosticls-configs.formatters.gofumpt'
```

### HTML
#### Linters

[stylelint][stylelint]

```lua
local stylelint = require 'diagnosticls-configs.linters.stylelint'
```

#### Formatters

[prettier][prettier]

```lua
local prettier = require 'diagnosticls-configs.formatters.prettier'
```

### JavaScript
#### Linters

[eslint][eslint]

```lua
local eslint = require 'diagnosticls-configs.linters.eslint'
```

[standard][standard]

```lua
local standard = require 'diagnosticls-configs.linters.standard'
```

[xo][xo]

```lua
local xo = require 'diagnosticls-configs.linters.xo'
```

#### Formatters

[prettier][prettier]

```lua
local prettier = require 'diagnosticls-configs.formatters.prettier'
```

[eslint_fmt][eslint]

```lua
local eslint_fmt = require 'diagnosticls-configs.formatters.eslint_fmt'
```

[eslint_d_fmt][eslint_d]

```lua
local eslint_d_fmt = require 'diagnosticls-configs.formatters.eslint_d_fmt'
```

[prettier_eslint][prettier_eslint]

```lua
local prettier_eslint = require 'diagnosticls-configs.formatters.prettier_eslint'
```

[prettier_standard][prettier_standard]

```lua
local prettier_standard = require 'diagnosticls-configs.formatters.prettier_standard'
```

[standard_fmt][standard]

```lua
local standard_fmt = require 'diagnosticls-configs.formatters.standard_fmt'
```

[xo_fmt][xo]

```lua
local xo_fmt = require 'diagnosticls-configs.formatters.xo_fmt'
```

### Lua
#### Linters

[luacheck][luacheck]

```lua
local luacheck = require 'diagnosticls-configs.linters.luacheck'
```

#### Formatters

[lua-format][lua-format]

```lua
local lua_format = require 'diagnosticls-configs.formatters.lua_format'
```

[stylua][stylua]

```lua
local stylua = require 'diagnosticls-configs.formatters.stylua'
```

### PHP
#### Linters

[phpcs][phpcs]

```lua
local phpcs = require 'diagnosticls-configs.linters.phpcs'
```

[phpstan][phpstan]

```lua
local phpstan = require 'diagnosticls-configs.linters.phpstan'
```

[psalm][psalm]

```lua
local psalm = require 'diagnosticls-configs.linters.psalm'
```

#### Formatters

[phpcbf][phpcs]

```lua
local phpcbf = require 'diagnosticls-configs.formatters.phpcbf'
```

### Python
#### Linters

[flake][flake]

```lua
local flake = require 'diagnosticls-configs.linters.flake'
```

[pylint][pylint]

```lua
local pylint = require 'diagnosticls-configs.linters.pylint'
```

[mypy][mypy]

```lua
local mypy = require 'diagnosticls-configs.linters.mypy'
```

#### Formatters

[autopep8][autopep8]

```lua
local autopep8 = require 'diagnosticls-configs.formatters.autopep8'
```

[black][black]

```lua
local black = require 'diagnosticls-configs.formatters.black'
```

### Ruby
#### Linters

[reek][reek]

```lua
local reek = require 'diagnosticls-configs.linters.reek'
```

[rubocop][rubocop]

```lua
local rubocop = require 'diagnosticls-configs.linters.rubocop'
```

### Swift
#### Linters

[swiftlint][swiftlint]

```lua
local swiftlint = require 'diagnosticls-configs.linters.swiftlint'
```

### TypeScript
#### Linters

[eslint][eslint]

```lua
local eslint = require 'diagnosticls-configs.linters.eslint'
```

[ts_standard][ts_standard]

```lua
local ts_standard = require 'diagnosticls-configs.linters.ts_standard'
```

[xo][xo]

```lua
local xo = require 'diagnosticls-configs.linters.xo'
```

#### Formatters

[prettier][prettier]

```lua
local prettier = require 'diagnosticls-configs.formatters.prettier'
```

[eslint_fmt][eslint]

```lua
local eslint_fmt = require 'diagnosticls-configs.formatters.eslint_fmt'
```

[prettier_eslint][prettier_eslint]

```lua
local prettier_eslint = require 'diagnosticls-configs.formatters.prettier_eslint'
```

[ts_standard_fmt][ts_standard]

```lua
local ts_standard_fmt = require 'diagnosticls-configs.formatters.ts_standard_fmt'
```

[xo_fmt][xo]

```lua
local xo_fmt = require 'diagnosticls-configs.formatters.xo_fmt'
```

### Vim
#### Linters

[vint][vint]

```lua
local vint = require 'diagnosticls-configs.linters.vint'
```

[//]: # (Linters/Formatters list)
[autopep8]: https://github.com/hhatto/autopep8
[black]: https://github.com/psf/black
[eslint]: https://github.com/eslint/eslint
[eslint_d]: https://github.com/mantoni/eslint_d.js
[flake]: https://github.com/PyCQA/flake8
[gofumpt]: https://github.com/mvdan/gofumpt
[golangci_lint]: https://github.com/golangci/golangci-lint
[mypy]: https://github.com/python/mypy
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
[stylua]: https://github.com/JohnnyMorganz/StyLua
[swiftlint]: https://github.com/realm/SwiftLint
