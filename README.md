# diagnosticls-configs-nvim

An unofficial collection of linter and formatter configurations for [diagnostic-languageserver][dls] to work with
builtin [nvim-lsp][lsp]. Works only for neovim >= 0.5.

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

#### Packer.nvim

```lua
use {
  { 'creativenull/diagnosticls-configs-nvim', tag = 'v0.1.8 }, -- `tag` is optional
  requires = { 'neovim/nvim-lspconfig' }
}
```

#### Vim-plug

```vim
Plug 'neovim/nvim-lspconfig'
Plug 'creativenull/diagnosticls-configs-nvim', { 'tag': 'v0.1.8' } " tag is optional
```

## Setup

First you need to initialize the plugin, this is where you can pass your own LSP options:

```lua
-- Lua file
local function on_attach(client)
  print('Attached to ' .. client.name)
end

local dlsconfig = require 'diagnosticls-configs'

dlsconfig.init {
  -- Your custom attach function
  on_attach = on_attach,
}
```

Finally, setup the linters/formatters according to the filetype, here is an example for running eslint and prettier
for `javascript` and `javascriptreact` filetype:

```lua
-- Lua file
local eslint = require 'diagnosticls-configs.linters.eslint'
local standard = require 'diagnosticls-configs.linters.standard'
local prettier = require 'diagnosticls-configs.formatters.prettier'
local prettier_standard = require 'diagnosticls-configs.formatters.prettier_standard'
dlsconfig.setup {
  ['javascript'] = {
    linter = eslint,
    formatter = prettier
  },
  ['javascriptreact'] = {
    -- Add multiple linters
    linter = { eslint, standard },
    -- Add multiple formatters
    formatter = { prettier, prettier_standard }
  }
}
```

## Default configuration

A default configuration for the supported filetypes is provided but not activated by default.

To activate the default configuration you can pass the `default_config` flag as true in the init function. Below are the
default values for init:

```lua
-- Lua file
dlsconfig.init {
  -- Use a list of default configurations
  -- set by this plugin
  -- (Default: false)
  default_config = false,

  -- Set to false if formatting is not needed at all,
  -- any formatter provided will be ignored
  -- (Default: true)
  format = true,
}

dlsconfig.setup()
```

You will still need to call the `setup()` after `init()` for the changes to take effect. You can still pass your custom
configurations to `setup()` as show in the [Setup section](#setup) and it will override any default configuration set
by `default_config` if it's for the same filetype.

NOTE: For `format` option it does not imply that it will "format on save". You still need to setup that in your lsp
on_attach handler.

## Advanced Configuration

If default configurations of a linter/formatter do not work for your use-case, or there are additional configuration
that needs to be added which is not provided by default. Then you can extend the built-in configurations with your own
modifications. The API is the same as [diagnostic-languageserver Initialization Options][dls-setup] on linter/formatter
structure. You can use `vim.tbl_extend()` to extend these tables:

```lua
-- Lua file
local eslint = require 'diagnosticls-configs.linter.eslint'

-- ESLint Extented Config
eslint = vim.tbl_extend('force', eslint, {

  -- REQUIRED: if `default_config` is enabled, separate name from original sourceName
  sourceName = 'eslint_extended',

  args = { 'extra', 'args' },
  rootPatterns = { '.git' }
})

dlsconfig.setup {
  javascript = {
    linter = eslint
  }
}
```

NOTE: If you have [`default_config` enabled](#default-configuration), then `sourceName` needs to be a different name
to the provided name, you can just add `_extended` or any other unique name to the extended configuration will work.
This is because other defaults might use the same linter of the same `sourceName` and would default to use
that instead of your own extended configuration.

# TODO

+ [X] Tests with busted/vusted or plenary - using plenary test_harness
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
