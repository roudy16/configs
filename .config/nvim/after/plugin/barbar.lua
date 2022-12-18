local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

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
--map('n', '<C-p>', '<Cmd>BufferPick<CR>', barbar_binding_opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', barbar_binding_opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', barbar_binding_opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', barbar_binding_opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', barbar_binding_opts)

