local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
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
  Plug 'cloudhead/neovim-fuzzy'
  Plug 'dracula/vim'
vim.call('plug#end')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require('lualine').setup({})
require('nvim-tree').setup({
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
})
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = false,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- LSP configuation
require('mason').setup({})
require('mason-lspconfig').setup({})
require('lspconfig').tsserver.setup({})
require('lspconfig').sumneko_lua.setup({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})
local cmp = require('cmp')
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
})
require('rust-tools').setup({})
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

-- BEGIN barbar config
local barbar_binding_opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<C-h>', '<Cmd>BufferPrevious<CR>', barbar_binding_opts)
map('n', '<C-l>', '<Cmd>BufferNext<CR>', barbar_binding_opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', barbar_binding_opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', barbar_binding_opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', barbar_binding_opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', barbar_binding_opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', barbar_binding_opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', barbar_binding_opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', barbar_binding_opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', barbar_binding_opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', barbar_binding_opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', barbar_binding_opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', barbar_binding_opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', barbar_binding_opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', barbar_binding_opts)
-- Close buffer
map('n', '<Leader>c', '<Cmd>BufferClose<CR>', barbar_binding_opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', barbar_binding_opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', barbar_binding_opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', barbar_binding_opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', barbar_binding_opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', barbar_binding_opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
-- END barbar config

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- Old-school vim config TODO: convert to lua
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
