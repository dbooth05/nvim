local opt = vim.o

-- Remove trailing spaces automatically on BufEnter
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",  -- This will apply to all buffers
  command = "silent! %s/\\s\\+$//e",  -- Removes trailing spaces
})

-- Remove `o` from formatoptions on BufEnter
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",  -- This will apply to all buffers
  command = "setlocal formatoptions-=o",  -- Removes 'o' from formatoptions
})

opt.autoindent = true  	-- copy indent from the previous line
opt.smartindent = true 	-- auto add extra indent
opt.expandtab = true   	-- use spaces instead of tabs

opt.shiftwidth = 4 	-- number of spaces per indent level
opt.tabstop = 4		-- number of spaces that a tab counts for
opt.softtabstop = 4	-- helps maintain spaces when pressing tab


