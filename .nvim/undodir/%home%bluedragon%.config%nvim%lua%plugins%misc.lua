Vim�UnDo� �����+|*!��nˁ$x7�}��iOu�QL3�u   >       ?                           g%:�    _�                             ����                                                                                                                                                                                                                                                                                                                                                             g%:�     �                   �               5��                    =                            5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             g%:�    �   >               �               >   ?-- Standalone plugins with less than 10 lines of config go here   return {     {   %    -- tmux & split window navigation   %    'christoomey/vim-tmux-navigator',     },     {       -- autoclose tags       'windwp/nvim-ts-autotag',     },     {   2    -- detect tabstop and shiftwidth automatically       'tpope/vim-sleuth',     },     {   '    -- Powerful Git integration for Vim       'tpope/vim-fugitive',     },     {   *    -- GitHub integration for vim-fugitive       'tpope/vim-rhubarb',     },     {       -- Hints keybinds       'folke/which-key.nvim',       opts = {         -- win = {         --   border = {   &      --     { '┌', 'FloatBorder' },   &      --     { '─', 'FloatBorder' },   &      --     { '┐', 'FloatBorder' },   &      --     { '│', 'FloatBorder' },   &      --     { '┘', 'FloatBorder' },   &      --     { '─', 'FloatBorder' },   &      --     { '└', 'FloatBorder' },   &      --     { '│', 'FloatBorder' },         --   },         -- },       },     },     {   4    -- Autoclose parentheses, brackets, quotes, etc.       'windwp/nvim-autopairs',       event = 'InsertEnter',       config = true,       opts = {},     },     {   -    -- Highlight todo, notes, etc in comments       'folke/todo-comments.nvim',       event = 'VimEnter',   /    dependencies = { 'nvim-lua/plenary.nvim' },       opts = { signs = false },     },     {   )    -- high-performance color highlighter   "    'norcalli/nvim-colorizer.lua',       config = function()   "      require('colorizer').setup()       end,     },   }5��            =      >                     b      �    >                      b                     5��