-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Custom
vim.keymap.set('n', '<D-p>', require('telescope.builtin').find_files, {})
vim.keymap.set('n', '<D-S-p>', require('telescope.builtin').find_files, {})
vim.keymap.set('n', '<D-k>', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<C-`>', '<C-^>')
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', '<leader>d', [["_d]]) -- delete to blackhole register
vim.keymap.set('v', '<Del>', [["_d]]) -- delete to blackhole register
vim.keymap.set('v', '<BS>', [["_d]]) -- delete to blackhole register
vim.keymap.set('n', 'YY', 'va{Vy') -- yank function including the name
vim.keymap.set('n', 'Q', '@qj') -- macros
vim.keymap.set('x', 'Q', ':norm @q<CR>') -- repeat more macros
vim.keymap.set('i', '<C-c>', '<Esc>')
-- Signature help
vim.keymap.set({ 'i', 'n' }, '<C-k>', vim.lsp.buf.signature_help)

-- More Diagnostics
vim.keymap.set('n', '<leader>l', function()
  vim.cmd 'ToggleDignosticsLocationList'
end, { desc = 'Open diagnostic [L]ocation list' })
vim.keymap.set('n', ']l', '<cmd>lnext<CR>')
vim.keymap.set('n', '[l', '<cmd>lprev<CR>')
vim.keymap.set('n', '<leader>q', function()
  vim.cmd 'ToggleDignosticsQuickFixList'
end, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', ']q', '<cmd>cnext<CR>')
vim.keymap.set('n', '[q', '<cmd>cprev<CR>')

vim.api.nvim_create_user_command('ToggleDignosticsLocationList', function()
  local win = vim.api.nvim_get_current_win()
  local qf_winid = vim.fn.getloclist(win, { winid = 0 }).winid
  if qf_winid > 0 then
    vim.cmd 'lclose'
  else
    vim.diagnostic.setloclist()
  end
end, { desc = 'Toggle Diagnostics Location List' })

vim.api.nvim_create_user_command('ToggleDignosticsQuickFixList', function()
  local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
  if qf_winid > 0 then
    vim.cmd 'cclose'
  else
    vim.diagnostic.setqflist()
  end
end, { desc = 'Toggle Diagnostics QuickFix List' })

-- Autoformat
vim.api.nvim_create_user_command('FormatDisable', function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})

vim.api.nvim_create_user_command('FormatEnable', function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = 'Re-enable autoformat-on-save',
})

return {}
