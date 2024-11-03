-- Function to setup formatting
local function setup_formatting(lang, formatprg)
  -- Set up auto formatting for the specified language
  vim.api.nvim_create_augroup(lang .. "Formatting", { clear = true })
  vim.api.nvim_create_autocmd("FileType", {
    pattern = lang,
    callback = function()
      vim.bo.formatprg = formatprg
    end,
    group = lang .. "Formatting"
  })

  -- Key mapping for formatting files
  -- vim.api.nvim_set_keymap("n", "<leader>fj", ":!prettierd %<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>fj", ":!prettierd " .. vim.fn.expand("%:p") .. "<CR>", { noremap = true, silent = true })
end

-- Setup formatting for Svelte
setup_formatting("svelte", "prettierd")

-- Setup formatting for HTML
setup_formatting("html", "prettierd")
