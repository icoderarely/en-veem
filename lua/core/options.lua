-- Neovim Configuration

local opt = vim.opt

-- General Options
opt.mouse = 'a' -- Enable mouse support
opt.relativenumber = true
opt.number = true
opt.autowrite = true -- Automatically save when switching buffers
opt.swapfile = false -- Disable swap files
opt.backup = false -- Disable backup files
-- opt.undodir = '.nvim/undodir/' -- Set directory for undo files
opt.undofile = true -- Enable undo files
opt.undolevels = 10000 -- Maximum number of undo levels
opt.confirm = true -- Prompt before overwriting files
opt.ignorecase = true -- Ignore case in search
opt.smartcase = true -- Use case-sensitive search if the query contains uppercase letters
opt.wrap = false -- Display lines as one long line
opt.linebreak = true -- Don't split words
opt.cursorline = true -- Highlight the line under the cursor
vim.wo.fillchars = 'eob: ' -- Set fillchars for empty lines
opt.scrolloff = 10 -- Keep 10 lines visible above/below the cursor
opt.splitright = true -- Split vertical windows to the right
opt.splitbelow = true -- Split horizontal windows below
opt.clipboard = 'unnamedplus' -- Use the system clipboard as the default register

-- Search Settings
opt.hlsearch = true -- Highlight search results
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- Clear search highlight with <Esc>
opt.pumheight = 10 -- Set height of pop-up menu

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank() -- Highlight text after yanking
  end,
})

-- Tabs & Indentation
opt.tabstop = 4 -- Number of spaces that a tab counts for
opt.shiftwidth = 4 -- Number of spaces used for each indentation level
opt.expandtab = true -- Convert tabs to spaces
opt.autoindent = true -- Copy indent from the current line when starting a new line
opt.breakindent = true -- Maintain indentation when wrapping lines
opt.softtabstop = 4 -- Number of spaces that a tab counts for while performing editing operations
opt.smartindent = true -- Make indenting smarter

-- Display Options
opt.cmdheight = 1 -- More space in the command line for displaying messages
opt.showmode = true -- Disable showing mode messages (like -- INSERT --)
opt.numberwidth = 4 -- Set number column width to 4
opt.termguicolors = true -- Enable true color support

-- Additional Settings
opt.updatetime = 250 -- Decrease update time for certain events
opt.timeoutlen = 300 -- Time to wait for a mapped sequence to complete (in milliseconds)
opt.writebackup = false -- Prevent editing if a file is being edited by another program
opt.whichwrap = 'bs<>[]hl' -- Control which keys can move between lines
opt.sidescrolloff = 8 -- Minimal number of screen columns to keep either side of the cursor

-- Backspace Behavior
opt.backspace = 'indent,eol,start' -- Allow backspace on indent, end of line, or start of insert mode

-- File Encoding
opt.fileencoding = 'utf-8' -- Set file encoding to UTF-8

-- Format Options
opt.shortmess:append 'c' -- Don't give |ins-completion-menu| messages
opt.iskeyword:append '-' -- Treat hyphenated words as a single word
opt.formatoptions:remove { 'c', 'r', 'o' } -- Don't auto-insert comment leaders

-- Runtime Path
opt.runtimepath:remove '/usr/share/vim/vimfiles' -- Separate Vim plugins from Neovim
