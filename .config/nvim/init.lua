local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
  Plug 'nvim-lua/plenary.nvim'
  Plug ('nvim-telescope/telescope.nvim', { branch = '0.1.x' })
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-vsnip' -- For vsnip users.
  Plug 'hrsh7th/vim-vsnip' -- For vsnip users.
  Plug 'simrat39/rust-tools.nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'romgrk/barbar.nvim'
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'dracula/vim'
  Plug 'navarasu/onedark.nvim'
  Plug 'vimwiki/vimwiki'
vim.call('plug#end')

require('lsp')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- vimwiki config
vim.g.vimwiki_list = {
  {
    path = '~/workspace/roudy16/journalings/wiki/src/',
    path_html = '~/workspace/roudy16/journalings/wiki/site_html/',
    html_filename_parameterization = 1,
    custom_wiki2html = 'vimwiki_markdown',
    template_path = '~/workspace/roudy16/journalings/wiki/templates/',
    template_ext = '.tpl',
    template_default = 'default',
    syntax = 'markdown',
    ext = '.md',
  }
}
-- limit Vimwiki's operation to only markdown files in the vimwiki_list paths
vim.g.vimwiki_global_ext = 0

require('onedark').load()

require('lualine').setup({})
require('nvim-tree').setup({
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
})
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "toml", "rust", "yaml" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require('rust-tools').setup({})
require('telescope').setup({})

-- Bindings
vim.g.mapleader = ' '

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<Leader>e", ":NvimTreeFocus<CR>")
map("n", "<C-p>", ":FuzzyOpen<CR>")

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- Old-school vim config TODO: convert to lua
vim.cmd [[
set nocompatible            " disable compatibility to old-time vi

filetype plugin indent on

syntax enable           " enable syntax processing
"colorscheme dracula
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
"set foldmethod=manual   " fold manually
"set foldmethod=indent   " fold based on indent level
"set foldmethod=syntax   " fold based on syntax
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
set foldlevelstart=10   " start with fold level of
set nofoldenable                     " Disable folding at startup.

" enable hidden buffers, a modified buffer can be hidden without saving
set hidden

" Tag settings
set tags=./tags;,tags;

" fixes 'no hg' problem with the neovim-fuzzy plugin
let g:fuzzy_rootcmds = [ ["git", "rev-parse", "--show-toplevel"] ]
]]

