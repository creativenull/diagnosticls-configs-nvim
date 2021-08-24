# Supported Linters and Formatters

Below are the supported linters and formatters that are configured to run with diagnostic-languageserver. Copy the
`require` code into your `setup()` function shown above.

### CSS/SCSS/LESS
#### Linters

[stylelint][stylelint]

```lua
local stylelint = require 'diagnosticls-configs.linters.stylelint' -- default
```

### Go
#### Linters

[golangci_lint][golangci_lint]

```lua
local golangci_lint = require 'diagnosticls-configs.linters.golangci_lint' -- default
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

[eslint][eslint]

```lua
local eslint = require 'diagnosticls-configs.linters.eslint' -- deflaut
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

[prettier][prettier]

```lua
local prettier = require 'diagnosticls-configs.formatters.prettier' -- default
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
local luacheck = require 'diagnosticls-configs.linters.luacheck' -- default
```

#### Formatters

[lua-format][lua-format]

```lua
local lua_format = require 'diagnosticls-configs.formatters.lua_format' --default
```

### PHP
#### Linters

[phpcs][phpcs]

```lua
local phpcs = require 'diagnosticls-configs.linters.phpcs' -- default
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

[flake][flake]

```lua
local flake = require 'diagnosticls-configs.linters.flake' -- default
```

[pylint][pylint]

```lua
local pylint = require 'diagnosticls-configs.linters.pylint'
```

#### Formatters

[autopep8][autopep8]

```lua
local autopep8 = require 'diagnosticls-configs.formatters.autopep8' -- default
```

[black][black]

```lua
local black = require 'diagnosticls-configs.formatters.black'
```

### Ruby
#### Linters

[reek][reek]

```lua
local reek = require 'diagnosticls-configs.linters.reek' -- default
```

[rubocop][rubocop]

```lua
local rubocop = require 'diagnosticls-configs.linters.rubocop'
```

### TypeScript
#### Linters

[eslint][eslint]

```lua
local eslint = require 'diagnosticls-configs.linters.eslint' -- default
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

[eslint_fmt][eslint]

```lua
local eslint_fmt = require 'diagnosticls-configs.formatters.eslint_fmt'
```

[prettier_eslint][prettier_eslint]

```lua
local prettier_eslint = require 'diagnosticls-configs.formatters.prettier_eslint'
```

[prettier][prettier]

```lua
local prettier = require 'diagnosticls-configs.formatters.prettier' -- default
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
local vint = require 'diagnosticls-configs.linters.vint' -- default
```
