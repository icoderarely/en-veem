-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- For conciseness
local opts = { noremap = true, silent = true }

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- save file without auto-formatting
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Buffers
if pcall(require, 'bufferline.nvim') then
  vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Previous buffer', noremap = true, silent = true })
  vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer', noremap = true, silent = true })
  vim.keymap.set('n', '<leader>bd', function()
    vim.cmd 'bprevious'
    vim.cmd 'bdelete #'
  end, { desc = 'Delete buffer', noremap = true, silent = true })
else
  vim.keymap.set('n', '<S-h>', '<cmd>bprev<cr>', { desc = 'Previous buffer', silent = true })
  vim.keymap.set('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next buffer', silent = true })
  vim.keymap.set('n', '<leader>bd', function()
    vim.cmd 'bprevious'
    vim.cmd 'bdelete #'
  end, { desc = 'Delete buffer', silent = true })
end
-- vim.keymap.set('n', '<leader>x', ':Bdelete!<CR>', opts) -- close buffer
-- vim.keymap.set('n', '<leader>x', ':bprevious<bar>bd#<cr>', opts) -- Switch to previous, then delete
vim.keymap.set('n', '<leader>x', ':bd<cr>', { noremap = true, silent = true, desc = 'Close buffer' })
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer
-- Define :Q to use bdelete
-- vim.cmd('command! Q bdelete')
-- Remap :q to :Q, so it deletes the buffer instead of quitting
-- vim.cmd('cabbrev q Q')

-- Increment/decrement numbers
vim.keymap.set('n', '<leader>+', '<C-a>', opts) -- increment
vim.keymap.set('n', '<leader>-', '<C-x>', opts) -- decrement

-- Move selected text up and down
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv") -- Up
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv") -- Down

-- Helix-like g-prefixed maps
vim.keymap.set('n', 'gh', '0', { desc = 'Goto line start' })
vim.keymap.set('n', 'gl', '$', { desc = 'Goto line end' })
vim.keymap.set('n', 'gs', '^', { desc = 'Goto first non-whitespace character' })

-- Lazy
vim.keymap.set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', opts) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts) -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts) --  go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Replace word under cursor
vim.keymap.set('n', '<leader>j', '*``cgn', opts)

-- Explicitly yank to system clipboard (highlighted and entire row)
-- vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
-- vim.keymap.set('n', '<leader>Y', [["+Y]])

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Toggle diagnostics
local diagnostics_active = true

vim.keymap.set('n', '<leader>do', function()
  diagnostics_active = not diagnostics_active

  if diagnostics_active then
    vim.diagnostic.enable(0)
  else
    vim.diagnostic.disable(0)
  end
end)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
