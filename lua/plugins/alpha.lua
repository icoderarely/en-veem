-- return {
--     'goolord/alpha-nvim',
--     dependencies = {
--         'nvim-tree/nvim-web-devicons',
--     },
--
--     config = function()
--         local alpha = require 'alpha'
--         local dashboard = require 'alpha.themes.startify'
--
--         dashboard.section.header.val = {
--             [[                                                    ]],
--             [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
--             [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
--             [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
--             [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
--             [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
--             [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
--             [[                                                    ]],
--         }
--
--         alpha.setup(dashboard.opts)
--     end,
-- }

return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  enabled = true,
  init = false,
  opts = function()
    local dashboard = require 'alpha.themes.dashboard'
    local logo = [[
         ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
         ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
         ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
         ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
         ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
         ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
    ]]

    dashboard.section.header.val = vim.split(logo, '\n')

    -- Define dashboard buttons
    dashboard.section.buttons.val = {
      dashboard.button('f', ' ' .. ' Find file', '<cmd>Telescope find_files<cr>'),
      dashboard.button('n', ' ' .. ' New file', [[<cmd> ene <BAR> startinsert <cr>]]),
      dashboard.button('r', ' ' .. ' Recent files', '<cmd>Telescope oldfiles<cr>'),
      dashboard.button('g', ' ' .. ' Find text', '<cmd>Telescope live_grep<cr>'),
      dashboard.button('c', ' ' .. ' Config', '<cmd>e ~/.config/nvim/init.lua<cr>'),
      dashboard.button('s', ' ' .. ' Restore Session', [[<cmd> lua require("persistence").load() <cr>]]),
      dashboard.button('x', ' ' .. ' Lazy Extras', '<cmd>LazyExtras<cr>'),
      dashboard.button('l', '󰒲 ' .. ' Lazy', '<cmd>Lazy<cr>'),
      dashboard.button('q', ' ' .. ' Quit', '<cmd>qa<cr>'),
    }

    -- Highlight buttons
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = 'AlphaButtons'
      button.opts.hl_shortcut = 'AlphaShortcut'
    end

    -- Set header/footer highlights
    dashboard.section.header.opts.hl = 'AlphaHeader'
    dashboard.section.buttons.opts.hl = 'AlphaButtons'
    dashboard.section.footer.opts.hl = 'AlphaFooter'
    dashboard.opts.layout[1].val = 8 -- Adjust layout

    return dashboard
  end,
  config = function(_, dashboard)
    -- Close Lazy if the filetype is lazy and open the dashboard
    if vim.o.filetype == 'lazy' then
      vim.cmd.close()
      vim.api.nvim_create_autocmd('User', {
        once = true,
        pattern = 'AlphaReady',
        callback = function()
          require('lazy').show() -- Show lazy.nvim
        end,
      })
    end

    require('alpha').setup(dashboard.opts)

    -- Set footer information after startup
    vim.api.nvim_create_autocmd('User', {
      once = true,
      pattern = 'LazyVimStarted',
      callback = function()
        local stats = require('lazy').stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms'
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
