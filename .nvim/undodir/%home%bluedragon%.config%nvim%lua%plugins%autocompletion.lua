VimUnDoå (pâ(¨áæc"JJbô6=/ZðD4Å3Ý                                     g%5­    _Ð                             ÿÿÿÿ                                                                                                                                                                                                                                                                                                                                                             g%2S    õ                   õ               5õ                                          Ñ      5_Ð                            ÿÿÿÿ                                                                                                                                                                                                                                                                                                                                                             g%5¬     õ                  õ                  return { -- Autocompletion     'hrsh7th/nvim-cmp',     -- event = 'InsertEnter',     dependencies = {   6    -- Snippet Engine & its associated nvim-cmp source       {         'L3MON4D3/LuaSnip',         build = (function()   =        -- Build Step is needed for regex support in snippets   B        -- This step is not supported in many windows environments   =        -- Remove the below condition to re-enable on windows   H        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then             return           end   &        return 'make install_jsregexp'         end)(),       },       'saadparwaiz1/cmp_luasnip',       *    -- Adds other completion capabilities.   J    --  nvim-cmp does not ship with all sources by default. They are split   5    --  into multiple repos for maintenance purposes.       'hrsh7th/cmp-nvim-lsp',       'hrsh7th/cmp-buffer',       'hrsh7th/cmp-path',       .    -- Adds a number of user-friendly snippets   #    'rafamadriz/friendly-snippets',     },     config = function()       local cmp = require 'cmp'   6    require('luasnip.loaders.from_vscode').lazy_load()   %    local luasnip = require 'luasnip'       luasnip.config.setup {}           local kind_icons = {         Text = 'ó°¿',         Method = 'm',         Function = 'ó°',         Constructor = 'ï¥',         Field = 'î',         Variable = 'ó°§',         Class = 'ó°',         Interface = 'ï¨',         Module = 'ï',         Property = 'ï­',         Unit = 'î',         Value = 'ó° ',         Enum = 'ï',         Keyword = 'ó°',         Snippet = 'ï',         Color = 'ó°',         File = 'ó°',         Reference = 'ï',         Folder = 'ó°',         EnumMember = 'ï',         Constant = 'ó°½',         Struct = 'ï³',         Event = 'ï§',         Operator = 'ó°',         TypeParameter = 'ó°',       }           cmp.setup {         snippet = {           expand = function(args)   '          luasnip.lsp_expand(args.body)           end,         },   =      completion = { completeopt = 'menu,menuone,noinsert' },         -- window = {   7      --     completion = cmp.config.window.bordered(),   :      --     documentation = cmp.config.window.bordered(),         -- },   +      mapping = cmp.mapping.preset.insert {   S        ['<C-j>'] = cmp.mapping.select_next_item(),       -- Select the [n]ext item   W        ['<C-k>'] = cmp.mapping.select_prev_item(),       -- Select the [p]revious item   ^        ['<CR>'] = cmp.mapping.confirm { select = true }, -- Accept the completion with Enter.   i        ['<C-c>'] = cmp.mapping.complete {},              -- Manually trigger a completion from nvim-cmp.       K        -- Think of <c-l> as moving to the right of your snippet expansion.   1        --  So if you have a snippet that's like:   !        --  function $name($args)           --    $body           --  end   
        --   O        -- <c-l> will move you to the right of each of the expansion locations.   9        -- <c-h> is similar, except moving you backwards.   *        ['<C-l>'] = cmp.mapping(function()   6          if luasnip.expand_or_locally_jumpable() then   $            luasnip.expand_or_jump()             end           end, { 'i', 's' }),   *        ['<C-h>'] = cmp.mapping(function()   .          if luasnip.locally_jumpable(-1) then               luasnip.jump(-1)             end           end, { 'i', 's' }),       ;        -- Select next/previous item with Tab / Shift + Tab   2        ['<Tab>'] = cmp.mapping(function(fallback)             if cmp.visible() then   "            cmp.select_next_item()   :          elseif luasnip.expand_or_locally_jumpable() then   $            luasnip.expand_or_jump()             else               fallback()             end           end, { 'i', 's' }),   4        ['<S-Tab>'] = cmp.mapping(function(fallback)             if cmp.visible() then   "            cmp.select_prev_item()   2          elseif luasnip.locally_jumpable(-1) then               luasnip.jump(-1)             else               fallback()             end           end, { 'i', 's' }),         },         sources = {           { name = 'nvim_lsp' },           { name = 'luasnip' },           { name = 'buffer' },           { name = 'path' },         },         formatting = {   ,        fields = { 'kind', 'abbr', 'menu' },   *        format = function(entry, vim_item)             -- Kind icons   H          vim_item.kind = string.format('%s', kind_icons[vim_item.kind])             -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind             vim_item.menu = ({               nvim_lsp = '[LSP]',   "            luasnip = '[Snippet]',                buffer = '[Buffer]',               path = '[Path]',             })[entry.source.name]             return vim_item           end,         },       }     end,   }5õ                                 Ñ            õ                                               5_Ð                             ÿÿÿÿ                                                                                                                                                                                                                                                                                                                                                             g%5¬    õ                   'hrsh7th/nvim-cmp',       -- event = 'InsertEnter',       dependencies = {   :        -- Snippet Engine & its associated nvim-cmp source   	        {               'L3MON4D3/LuaSnip',               build = (function()   E                -- Build Step is needed for regex support in snippets   J                -- This step is not supported in many windows environments   E                -- Remove the below condition to re-enable on windows   P                if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then                       return                   end   .                return 'make install_jsregexp'               end)(),   
        },   #        'saadparwaiz1/cmp_luasnip',       .        -- Adds other completion capabilities.   N        --  nvim-cmp does not ship with all sources by default. They are split   9        --  into multiple repos for maintenance purposes.           'hrsh7th/cmp-nvim-lsp',           'hrsh7th/cmp-buffer',           'hrsh7th/cmp-path',       2        -- Adds a number of user-friendly snippets   '        'rafamadriz/friendly-snippets',       },       config = function()   !        local cmp = require 'cmp'   :        require('luasnip.loaders.from_vscode').lazy_load()   )        local luasnip = require 'luasnip'           luasnip.config.setup {}               local kind_icons = {               Text = 'ó°¿',               Method = 'm',               Function = 'ó°',                Constructor = 'ï¥',               Field = 'î',               Variable = 'ó°§',               Class = 'ó°',               Interface = 'ï¨',               Module = 'ï',               Property = 'ï­',               Unit = 'î',               Value = 'ó° ',               Enum = 'ï',               Keyword = 'ó°',               Snippet = 'ï',               Color = 'ó°',               File = 'ó°',               Reference = 'ï',               Folder = 'ó°',               EnumMember = 'ï',               Constant = 'ó°½',               Struct = 'ï³',               Event = 'ï§',               Operator = 'ó°',   #            TypeParameter = 'ó°',   	        }               cmp.setup {               snippet = {   '                expand = function(args)   1                    luasnip.lsp_expand(args.body)                   end,               },   C            completion = { completeopt = 'menu,menuone,noinsert' },               -- window = {   =            --     completion = cmp.config.window.bordered(),   @            --     documentation = cmp.config.window.bordered(),               -- },   1            mapping = cmp.mapping.preset.insert {   U                ['<C-j>'] = cmp.mapping.select_next_item(), -- Select the [n]ext item   Y                ['<C-k>'] = cmp.mapping.select_prev_item(), -- Select the [p]revious item   f                ['<CR>'] = cmp.mapping.confirm { select = true }, -- Accept the completion with Enter.   i                ['<C-c>'] = cmp.mapping.complete {},      -- Manually trigger a completion from nvim-cmp.       S                -- Think of <c-l> as moving to the right of your snippet expansion.   9                --  So if you have a snippet that's like:   )                --  function $name($args)                   --    $body                   --  end                   --   W                -- <c-l> will move you to the right of each of the expansion locations.   A                -- <c-h> is similar, except moving you backwards.   2                ['<C-l>'] = cmp.mapping(function()   @                    if luasnip.expand_or_locally_jumpable() then   0                        luasnip.expand_or_jump()                       end   #                end, { 'i', 's' }),   2                ['<C-h>'] = cmp.mapping(function()   8                    if luasnip.locally_jumpable(-1) then   (                        luasnip.jump(-1)                       end   #                end, { 'i', 's' }),       C                -- Select next/previous item with Tab / Shift + Tab   :                ['<Tab>'] = cmp.mapping(function(fallback)   )                    if cmp.visible() then   .                        cmp.select_next_item()   D                    elseif luasnip.expand_or_locally_jumpable() then   0                        luasnip.expand_or_jump()                       else   "                        fallback()                       end   #                end, { 'i', 's' }),   <                ['<S-Tab>'] = cmp.mapping(function(fallback)   )                    if cmp.visible() then   .                        cmp.select_prev_item()   <                    elseif luasnip.locally_jumpable(-1) then   (                        luasnip.jump(-1)                       else   "                        fallback()                       end   #                end, { 'i', 's' }),               },               sources = {   &                { name = 'nvim_lsp' },   %                { name = 'luasnip' },   $                { name = 'buffer' },   "                { name = 'path' },               },               formatting = {   4                fields = { 'kind', 'abbr', 'menu' },   2                format = function(entry, vim_item)   !                    -- Kind icons   R                    vim_item.kind = string.format('%s', kind_icons[vim_item.kind])   ¥                    -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind   &                    vim_item.menu = ({   +                        nvim_lsp = '[LSP]',   .                        luasnip = '[Snippet]',   ,                        buffer = '[Buffer]',   (                        path = '[Path]',   )                    })[entry.source.name]   #                    return vim_item                   end,               },   	        }       end,5õ                              b            5çª