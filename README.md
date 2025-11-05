# diagnosticls-configs-nvim

<a href="https://dotfyle.com/plugins/creativenull/diagnosticls-configs-nvim">
  <img src="https://dotfyle.com/plugins/creativenull/diagnosticls-configs-nvim/shield"
  alt="Configs on dotfyle">
</a>

An unofficial collection of linter and formatter configurations for [diagnostic-languageserver][dls] to work with
builtin [nvim-lsp][lsp]. Works only for Neovim >= 0.10.

## Supported linters and formatters

Check out [supported-linters-and-formatters.md](supported-linters-and-formatters.md)

## Features

- Intelligently detect tools installed project-wide or system-wide - works only for node/npm, php/composer and
  ruby/bundler, additional support for other build tools coming soon.
- Use `:checkhealth` to see any missing tools.
- Customize configs for your project needs.

## Installation

### Requirements

- [diagnostic-languageserver][dls], globally installed: `npm i -g diagnostic-languageserver` or via mason.nvim plugin
- [Neovim v0.10 and up][neovim] (Does not work work Vim as it does not have a built-in lsp client)
- [nvim-lspconfig][lspconfig] plugin (only required if using nvim <= 0.10)

#### lazy.nvim

```lua
{
    'creativenull/diagnosticls-configs-nvim',
    version = 'v1.x.x',
    dependencies = { 'neovim/nvim-lspconfig' } -- not required if using nvim >= 0.11
}
```

#### vim-plug

```vim
Plug 'neovim/nvim-lspconfig' " not required if using nvim >= 0.11
Plug 'creativenull/diagnosticls-configs-nvim', { 'tag': 'v1.*' }
```

## Setup

Use the `create()` to start adding the tools you want to run for the different filetypes. `dls_config` will create the
necessary `init_options` for diagnostic-languageserver which you can then pass to `vim.lsp.config()` or to the lspconfig
plugin.

```lua
local eslint = require('diagnosticls-configs.linters.eslint')
local prettier = require('diagnosticls-configs.formatters.prettier')
local stylua = require('diagnosticls-configs.formatters.stylua')
local dls_config = require('diagnosticls-configs').create({
    javascript = {
        linters = { eslint },
        formatters = { prettier },
    },
    json = {
        formatters = { prettier },
    },
    lua = {
        formatters = { prettier },
    }
})

-- If using nvim >= 0.11 then use the following
vim.lsp.config('diagnosticls', vim.tbl_extend('force', dls_config, {
    cmd = { 'diagnostic-languageserver', '--stdio' },
    root_markers = { '.git' }

    -- Pass your custom lsp config below like on_attach and capabilities
    --
    -- on_attach = on_attach,
    -- capabilities = capabilities,
}))

-- If using nvim <= 0.10 then use the following
require('lspconfig').diagnosticls.setup(vim.tbl_extend('force', dls_config, {
    -- Pass your custom lsp config below like on_attach and capabilities
    --
    -- on_attach = on_attach,
    -- capabilities = capabilities,
}))
```

## Default configuration

If you do not want to individually add each linter/formatter to each filetypes then you can use the `defaults()` function
to use a list of default configurations.

To use the default configuration without having to use `create()` use the following before calling `vim.lsp.config()` or
`require('lspconfig').diagnosticls.setup()`:

```lua
local dls_config = require('diagnosticls-configs').defaults()
```

## Advanced Configuration

If default configurations of a linter/formatter do not work for your use-case, or there are additional configuration
that needs to be added which is not provided by default. Then you can extend the built-in configurations with your own
modifications. The API is the same as [diagnostic-languageserver Initialization Options][dls-setup] on linter/formatter
structure. Here is an example if you want to change the arguments for the `eslint` linter:

```lua
local eslint = require('diagnosticls-configs.linters.eslint')
eslint.command = '/another/path/to/eslint'
```

You can then pass this to `create()` or `defaults()` to use the modified configuration.

## Contributing

First of all, thank you for your interest in contributing!

To help create configurations start with the [diagnostic-languageserver API][dls-setup] to know how the object is
structured for a linter or a formatter. Also [check out the wiki][dls-wiki] to see some examples. Finally, check out the
configurations created in the `lua/diagnosticls-configs/linters` and/or in `lua/diagnosticls-configs/formatters` and see
how they are implemented.

Tools required for linting and formatting for this project (which are also supported by this plugin):

- [`luacheck`][luacheck] - Linting
- [`stylua`][stylua] - Formatting

For testing, add the relevant test logic in `tests/diagnosticls-configs` and then run:

```sh
make test
```

## Credits

Credits goes to the following repos for inspiration:

- [Diagnostic Language Server](https://github.com/iamcco/diagnostic-languageserver) - for example configs in json format
- [ale](https://github.com/dense-analysis/ale) - for a vibrate list of supported linters/formatters to look through and
  implement

[dls]: https://github.com/iamcco/diagnostic-languageserver
[dls-setup]: https://github.com/iamcco/diagnostic-languageserver#config--document
[dls-wiki]: https://github.com/iamcco/diagnostic-languageserver/wiki
[lsp]: https://neovim.io/doc/user/lsp.html
[packer]: https://github.com/wbthomason/packer.nvim
[luacheck]: https://github.com/mpeterv/luacheck
[stylua]: https://github.com/JohnnyMorganz/StyLua
[lspconfig]: https://github.com/neovim/nvim-lspconfig
[neovim]: https://github.com/neovim/neovim
