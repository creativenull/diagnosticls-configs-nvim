# diagnosticls-configs-nvim

<a href="https://dotfyle.com/plugins/creativenull/diagnosticls-configs-nvim">
  <img src="https://dotfyle.com/plugins/creativenull/diagnosticls-configs-nvim/shield"
  alt="Configs on dotfyle">
</a>

An unofficial collection of linter and formatter configurations for [diagnostic-languageserver][dls] to work with
builtin [nvim-lsp][lsp]. Works only for Neovim >= 0.5.

## Supported linters and formatters

[supported-linters-and-formatters.md](supported-linters-and-formatters.md)

## Features

+ Intelligently detect tools installed project-wide or system-wide - works only for node/npm, php/composer and
  ruby/bundler, additional support for other build tools coming soon.
+ Use `:checkhealth` to see any missing tools.
+ Customize configs for your project needs.

## Installation
### Requirements

+ [Neovim v0.8 and up][neovim]
+ [nvim-lspconfig][lspconfig]
+ [Diagnostic-languageserver][dls], globally installed: `npm i -g diagnostic-languageserver` (or via [Mason.nvim][mason])

You will need to install `diagnostic-languageserver` and `nvim-lspconfig` before using this plugin.

#### Lazy.nvim

```lua
{
    'creativenull/diagnosticls-configs-nvim',
    tag = 'v1.x.x', -- `tag` is optional
    dependencies = { 'neovim/nvim-lspconfig' },
}
```

#### Packer.nvim

```lua
use {
    'creativenull/diagnosticls-configs-nvim',
    tag = 'v1.*', -- `tag` is optional
    requires = 'neovim/nvim-lspconfig',
}
```

#### Vim-plug

```vim
Plug 'neovim/nvim-lspconfig'
Plug 'creativenull/diagnosticls-configs-nvim', { 'tag': 'v1.*' } " tag is optional
```

## Setup

The only thing this plugin provides is a wrapper to be passed to `nvim-lspconfig` with the presets provided by this
plugin. This way you can customize any other config you've already setup for diagnostic-languageserver and extend them
however you like.

```lua
local function on_attach(client)
  print('Attached to ' .. client.name)
end

local eslint = require('diagnosticls-configs.linters.eslint')
local prettier = require('diagnosticls-configs.formatters.prettier')
local dls_config = require('diagnosticls-configs').create({
  javascript = {
    linters = { eslint },
    formatters = { prettier },
  },
  typescript = {
    linters = { eslint },
    formatters = { prettier },
  },
})

require('lspconfig').diagnosticls.setup(vim.tbl_extend('force', dls_config, {
  -- Pass your custom lsp config below like on_attach and capabilities
  --
  -- on_attach = on_attach,
  -- capabilities = capabilities,
}))
```

## The `setup()`

If you want to adjust `diagnosticls-configs` settings, you will need to call `setup()` before you call `create()` in
order to save your preference before any linter/formatter could be provided.

Currently, there are only two options we provide:

- `defaults` - Provides you with a list of pre-configurations for all languages.
  Check [supported list](supported-linters-and-formatters.md)) for a list of supported languages that are
  pre-configured.
- `format` - Enable/disable formatters, if you only need to use linters.

```lua
require('diagnosticls-configs').setup({
  -- Use a list of default configurations
  -- set by this plugin
  -- (Default: false)
  defaults = false,

  -- Set to false if formatting is not needed at all,
  -- any formatter provided will be ignored
  -- (Default: true)
  format = true,
})

-- Then call create()
local dls_config = require('diagnosticls-configs').create()
```

### Default configuration

As provided via `setup()`, you can enable a list of default configurations (check [supported-linters-and-formatters.md](supported-linters-and-formatters.md))

```lua
require('diagnosticls-configs').setup({ defaults = true })

local dls_config = require('diagnosticls-configs').create()
```

You can also override the defaults by providing the same table as before.

```lua
require('diagnosticls-configs').setup({ defaults = true })

local dls_config = require('diagnosticls-configs').create({
  -- Override javascript linters
  javascript = {
    linters = { require('diagnosticls-configs.linters.eslint') },
  },
})
```

### Opt-out formatters

If you only want to use diagnostic-languageserver for linting, then you can disable formatters provided by `defaults`
or your custom formatter configs.

```lua
require('diagnosticls-configs').setup({
    defaults = true,
    format = false,
})

local dls_config = require('diagnosticls-configs').create()
```

## Advanced Configuration

If you want to extend a config, where it's required to conform to your project or your preference, then make use of
`vim.tbl_extend()` and provide your changes. Consult the [diagnostic-languageserver Configuration Documentation](https://github.com/iamcco/diagnostic-languageserver#config--document)
to see what options you can adjust for a linter or a formatter.

```lua
-- Example
local prettier = require('diagnosticls-configs.formatters.prettier')
prettier = vim.tbl_extend('force', prettier, {
    -- Override
    sourceName = 'prettier_ext',
    args = { 'additional', 'args' },
})
```

## Troubleshooting

If you get "no executable found" issues in `:checkhealth`, this means that the
linter or formatter was not found in the provided filepath. Ensure that it is
installed globally or in a valid filepath.

For nodejs/npm, php/composer, ruby/bundler: check if the linter/formatter
is installed in your node\_modules (npm), vendor (composer/bundler) project
folder, or installed globally.

## Alternatives

- ALE - [https://github.com/dense-analysis/ale](https://github.com/dense-analysis/ale)
- diagnostic-languageserver - [https://github.com/iamcco/diagnostic-languageserver](https://github.com/iamcco/diagnostic-languageserver)
- guard.nvim - [https://github.com/nvimdev/guard.nvim](https://github.com/nvimdev/guard.nvim)
- nvim-lint - [https://github.com/mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint)
- formatter.nvim - [https://github.com/mhartington/formatter.nvim](https://github.com/mhartington/formatter.nvim)

## Contributing

The main part is adding linters and formatters to the repo. Start from going over the
[Diagnostic-languageserver API][dls-setup] and the [examples][dls-wiki] that they provide. Finally have a look at
`lua/diagnosticls-configs/linters` or `lua/diagnosticls-configs/formatters` on this repo to see how we set them up.

Make a PR with the additions or changes to the configurations.

### Testing

The following should run and validate linters/formatters:

```sh
make test
```

## Credits

Credits goes to the following repos for inspiration:

+ [Diagnostic-languageserver](https://github.com/iamcco/diagnostic-languageserver) - for example configs in json format
+ [ALE](https://github.com/dense-analysis/ale) - for a vibrate list of supported linters/formatters to look through and implement

[dls]: https://github.com/iamcco/diagnostic-languageserver
[dls-setup]: https://github.com/iamcco/diagnostic-languageserver#config--document
[dls-wiki]: https://github.com/iamcco/diagnostic-languageserver/wiki
[lsp]: https://neovim.io/doc/user/lsp.html
[lspconfig]: https://github.com/neovim/nvim-lspconfig
[neovim]: https://github.com/neovim/neovim
[mason]: https://github.com/williamboman/mason.nvim
