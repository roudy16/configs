local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
  Plug 'nvim-tree/nvim-web-devicons' 
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'dracula/vim'
vim.call('plug#end')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require('lualine').setup()
require('nvim-tree').setup({
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
})

vim.cmd [[
set nocompatible            " disable compatibility to old-time vi

filetype plugin indent on

syntax enable           " enable syntax processing
colorscheme dracula
"colorscheme badwolf

" Misc
set t_Co=256
set encoding=utf8
set backspace=indent,eol,start
set list
set listchars=tab:>-,trail:~
"
" Spaces & Tabs
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
set modelines=1
filetype indent on
filetype plugin on
set autoindent
"
" UI Layout
set number              " show line numbers
set showcmd             " show command in bottom bar
set nocursorline        " highlight current line
set wildmenu
set lazyredraw
set showmatch           " higlight matching parenthesis
set fillchars+=vert:\│
"
" Searching
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
"
" Folding
"=== folding ===
set foldmethod=manual   " fold manually
"set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
set foldlevelstart=10   " start with fold level of

" enable hidden buffers, a modified buffer can be hidden without saving
set hidden

" Tag settings
set tags=./tags;,tags;
]]
