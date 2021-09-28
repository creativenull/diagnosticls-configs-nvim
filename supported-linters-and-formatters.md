# Supported Linters and Formatters

Below are the supported linters and formatters that are configured to run with diagnostic-languageserver. You can access
the table of contents of this document on the left hand corner of the file, in github. Copy the `require` code into your
`setup()` function shown above.

Linters/Formatters labeled with __Default__ are set when `default_config` is set to `true` in the
[`init()` configuration](https://github.com/creativenull/diagnosticls-configs-nvim#default-configuration).

### CSS/SCSS/LESS
#### Linters

[stylelint][stylelint] (Default)

```lua
local stylelint = require 'diagnosticls-configs.linters.stylelint'
```

### Go
#### Linters

[golangci_lint][golangci_lint] (Default)

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

### JavaScript
#### Linters

[eslint][eslint] (Default)

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

[prettier][prettier] (Default)

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

[luacheck][luacheck] (Default)

```lua
local luacheck = require 'diagnosticls-configs.linters.luacheck'
```

#### Formatters

[lua-format][lua-format] (Default)

```lua
local lua_format = require 'diagnosticls-configs.formatters.lua_format'
```

[stylua][stylua]

```lua
local stylua = require 'diagnosticls-configs.formatters.stylua'
```

### PHP
#### Linters

[phpcs][phpcs] (Default)

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

### Python
#### Linters

[flake][flake] (Default)

```lua
local flake = require 'diagnosticls-configs.linters.flake'
```

[pylint][pylint]

```lua
local pylint = require 'diagnosticls-configs.linters.pylint'
```

#### Formatters

[autopep8][autopep8] (Default)

```lua
local autopep8 = require 'diagnosticls-configs.formatters.autopep8'
```

[black][black]

```lua
local black = require 'diagnosticls-configs.formatters.black'
```

### Ruby
#### Linters

[reek][reek] (Default)

```lua
local reek = require 'diagnosticls-configs.linters.reek'
```

[rubocop][rubocop]

```lua
local rubocop = require 'diagnosticls-configs.linters.rubocop'
```

### TypeScript
#### Linters

[eslint][eslint] (Default)

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

[prettier][prettier] (Default)

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

[vint][vint] (Default)

```lua
local vint = require 'diagnosticls-configs.linters.vint'
```

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
[stylua]: https://github.com/JohnnyMorganz/StyLua
