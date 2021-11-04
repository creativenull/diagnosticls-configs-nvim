# diagnosticls-configs-nvim (Status: Stable-ish)

A collection of linters and formatters configured for [diagnostic language server][dls] to work with [nvim-lsp][lsp].
Have a look at the currently [supported linters/formatters](supported-linters-and-formatters.md).

# TODO

+ [ ] Add tests (idk how, but somehow)
+ [ ] Implement checks to let user if the tool not available, and advise on how to setup the tool
+ [X] Add ability to override args, root patterns, etc
+ [X] Add vim docs
+ [X] Add contributing content
+ [X] Add feature to allow multiple linters/formatters: [see ref](https://github.com/iamcco/diagnostic-languageserver#config--document)

## Installation
### Requirements

+ [Neovim v0.5 and up][neovim] (Does not work work Vim as it does have a built-in lsp client)
+ [nvim-lspconfig][lspconfig] plugin
+ [Diagnostic Language Server][dls], globally installed: `npm i -g diagnostic-languageserver`

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
  -- Your custom attach function
  on_attach = on_attach,
}
```

Finally, setup the linters/formatters according to the filetype, here is an example for running eslint and prettier
for `javascript` and `javascriptreact` filetype:

```lua
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
dlsconfig.init {
  -- Apply default config for supported linters and formatters
  default_config = false,
  -- Default to true, use false if you don't want to setup formatters by default
  format = true
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

Check out [supported-linters-and-formatters.md](supported-linters-and-formatters.md)

## Contributing

First of all, thank you for your contribution 🙂

To help create configurations start with the [diagnostic-languageserver API][dls-setup] to know how the object is
structured for a linter or a formatter. Also check out the [wiki][dls-wiki] to see examples. Finally, check out the
configurations created in the `lua/diagnosticls-configs/linters` and `lua/diagnosticls-configs/formatters` and see how
they are implemented.

Requirements for contributing code should be linted by [`luacheck`][luacheck] and formatted with [`stylua`][stylua].

## Credits

Credits goes to the following repos for inspiration:

+ [Diagnostic Language Server](https://github.com/iamcco/diagnostic-languageserver) for example configs in json format
+ [ale](https://github.com/dense-analysis/ale) for a vibrate list of supported linters/formatters to look through

[dls]: https://github.com/iamcco/diagnostic-languageserver
[dls-setup]: https://github.com/iamcco/diagnostic-languageserver#config--document
[dls-wiki]: https://github.com/iamcco/diagnostic-languageserver/wiki
[lsp]: https://neovim.io/doc/user/lsp.html
[packer]: https://github.com/wbthomason/packer.nvim
[luacheck]: https://github.com/mpeterv/luacheck
[stylua]: https://github.com/JohnnyMorganz/StyLua
[lspconfig]: https://github.com/neovim/nvim-lspconfig
[neovim]: https://github.com/neovim/neovim
