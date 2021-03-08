# DiagnosticLS-nvim (Status: Experimental)

A collection of linters and formatters configured for [diagnostic language server][dls] to work with [nvim-lsp][lsp]

## Installation
### Requirements

+ DiagnosticLS, globally installed: `npm i -g diagnostic-languageserver`
+ nvim-lspconfig

### Install w/ Packer.nvim example

You will need to install `nvim-lspconfig` before using this plugin. Using [packer.nvim][packer] as an example:

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

require'diagnosticls-nvim'.init {
  on_attach = on_attach, -- Custom attach function
  root_dir = require'lspconfig'.util.root_pattern('.git')
}
```

Finally, setup the linters/formatters according to the filetype, here is an example for running eslint and prettier
for `javascript` and `javascriptreact` filetype:

```lua
require'diagnosticls-nvim'.setup {
  javascript = {
    linter = 'eslint',
    formatter = 'prettier'
  },
  javascriptreact = {
    linter = 'eslint',
    formatter = 'prettier'
  }
}
```

[dls]: https://github.com/iamcco/diagnostic-languageserver
[lsp]: https://neovim.io/doc/user/lsp.html
[packer]: https://github.com/wbthomason/packer.nvim
