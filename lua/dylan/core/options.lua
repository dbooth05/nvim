local opt = vim.o

opt.autoindent = true  	-- copy indent from the previous line
opt.smartindent = true 	-- auto add extra indent
opt.expandtab = true   	-- use spaces instead of tabs

opt.shiftwidth = 4 	-- number of spaces per indent level
opt.tabstop = 4		-- number of spaces that a tab counts for
opt.softtabstop = 4	-- helps maintain spaces when pressing tab

vim.cmd([[ autocmd BufEnter * %s/\s\+$//e ]]) -- remove trailing white space auto
vim.cmd([[ autocmd BufEnter * setlocal formatoptions-=o ]]) -- fix \n behavior
