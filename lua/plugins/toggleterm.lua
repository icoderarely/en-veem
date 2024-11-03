return {
  'akinsho/toggleterm.nvim',
  -- config = true,
  cmd = 'ToggleTerm',
  build = ':ToggleTerm',
  keys = {
    --   { '<leader>tt', '<cmd>ToggleTerm<cr>', desc = 'Toggle floating terminal' },
    --   { '<C-_>', '<cmd>ToggleTerm<cr>', desc = 'Toggle floating terminal' },
    { '<C-t>', '<cmd>ToggleTerm<cr>', desc = 'Toggle floating terminal' },
  },
  opts = {
    open_mapping = [[<C-/>]],
    direction = 'horizontal',
    shade_terminals = true, -- Dim terminals for better readability
    shading_factor = 3,
    persist_size = true, -- Maintain terminal size across sessions
    persist_mode = true, -- Remember the last mode the terminal was in
    shade_filetypes = {},
    hide_numbers = true,
    insert_mappings = true,
    terminal_mappings = true,
    start_in_insert = true,
    shell = vim.o.shell, -- Default shell
    close_on_exit = true,
  },
  winbar = {
    enabled = false,
  },
}
