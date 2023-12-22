# diagnosticls-configs-nvim

<a href="https://dotfyle.com/plugins/creativenull/diagnosticls-configs-nvim">
  <img src="https://dotfyle.com/plugins/creativenull/diagnosticls-configs-nvim/shield"
  alt="Configs on dotfyle">
</a>

An unofficial collection of linter and formatter configurations for [diagnostic-languageserver][dls] to work with
builtin [nvim-lsp][lsp]. Works only for Neovim >= 0.5.

## Supported linters and formatters

Check out [supported-linters-and-formatters.md](supported-linters-and-formatters.md)

## Features

+ Intelligently detect tools installed project-wide or system-wide - works only for node/npm, php/composer and
  ruby/bundler, additional support for other build tools coming soon.
+ Use `:checkhealth` to see any missing tools.
+ Customize configs for your project needs.

## Installation
### Requirements

+ [Neovim v0.5 and up][neovim] (Does not work work Vim as it does have a built-in lsp client)
+ [nvim-lspconfig][lspconfig] plugin
+ [Diagnostic Language Server][dls], globally installed: `npm i -g diagnostic-languageserver`

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

If you want linters and formatters for your language (check out the [supported list](supported-linters-and-formatters.md)),
or if you just want linters and not formatters during before creating the `lspconfig` setup, then you can make use of
`setup()` before calling `create()` to adjust those settings.

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
```

### Default configuration

We have a list of default configurations for some languages but this is an opt-in feature. To enable it use `setup()`
to include defaults. Check the [supported-linters-and-formatters.md](supported-linters-and-formatters.md) to see
the provided defaults.

```lua
require('diagnosticls-configs').setup({
    defaults = true
})
local dls_config = require('diagnosticls-configs').create()
```

You can also override the default by providing the same table as before.

```lua
require('diagnosticls-configs').setup({
    defaults = true
})
local dls_config = require('diagnosticls-configs').create({
  -- override .js linter
  javascript = {
    linters = { require('diagnosticls-configs.linters.eslint') },
  },
})
```

### Opt-out formatters

If you do not want to include formatters and just want to use diagnostic-languageserver for linting, then you can turn
off via `setup()`.

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
    -- overrides
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

# TODO

+ [X] Tests with busted/vusted or plenary - using plenary test\_harness
+ [X] Use `:checkhealth` to display status of linters/formatters registered with plugin
+ [X] Add ability to override args, root patterns, etc
+ [X] Add vim docs
+ [X] Add contributing content
+ [X] Add feature to allow multiple linters/formatters: [see ref](https://github.com/iamcco/diagnostic-languageserver#config--document)

## Contributing

First of all, thank you for your contribution 🙂!

To help create configurations start with the [diagnostic-languageserver API][dls-setup] to know how the object is
structured for a linter or a formatter. Also [check out the wiki][dls-wiki] to see some examples. Finally, check out the
configurations created in the `lua/diagnosticls-configs/linters` and `lua/diagnosticls-configs/formatters` and see how
they are implemented.

Tools required for linting and formatting for this project (which are also supported by this plugin):
+ [`luacheck`][luacheck] - Linting
+ [`stylua`][stylua] - Formatting

For testing, add the relevant test logic in `tests/diagnosticls-configs` and then run:

```sh
make test
```

## Credits

Credits goes to the following repos for inspiration:

+ [Diagnostic Language Server](https://github.com/iamcco/diagnostic-languageserver) - for example configs in json format
+ [ale](https://github.com/dense-analysis/ale) - for a vibrate list of supported linters/formatters to look through and implement

[dls]: https://github.com/iamcco/diagnostic-languageserver
[dls-setup]: https://github.com/iamcco/diagnostic-languageserver#config--document
[dls-wiki]: https://github.com/iamcco/diagnostic-languageserver/wiki
[lsp]: https://neovim.io/doc/user/lsp.html
[packer]: https://github.com/wbthomason/packer.nvim
[luacheck]: https://github.com/mpeterv/luacheck
[stylua]: https://github.com/JohnnyMorganz/StyLua
[lspconfig]: https://github.com/neovim/nvim-lspconfig
[neovim]: https://github.com/neovim/neovim
