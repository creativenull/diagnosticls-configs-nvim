let s:custom_data_dir = getcwd() . '/tests/nvim-data'
execute printf('set runtimepath+=%s', s:custom_data_dir)

" Vim-plug setup w/ plenary
let s:plugin = {}
let s:plugin.url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
let s:plugin.plug_filepath = s:custom_data_dir . '/autoload/plug.vim'
let s:plugin.plugins_dir = s:custom_data_dir . '/plugged'

if !filereadable(s:plugin.plug_filepath)
  execute printf('!curl -fLo %s --create-dirs %s', s:plugin.plug_filepath, s:plugin.url)
endif

call plug#begin(s:plugin.plugins_dir)
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug printf('%s', getcwd())
call plug#end()
