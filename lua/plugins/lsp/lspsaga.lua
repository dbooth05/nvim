local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
    return
end

vim.diagnostic.config({
  virtual_text = {
    prefix = "-",
    spacing = 4,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

saga.setup({
	ui = {
		border = "rounded",
		devicon = true,
	},
	symbol_in_winbar = {
		enable = true,
		separator = "  ",
		hide_keyword = true,
	},
	lightbulb = {
		enable = false,
	},
})
