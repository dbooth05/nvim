require("plugins-setup")

-- setting up options
require("core.options")
require("core.keymaps")
require("core.colorscheme")


require("plugins.nvim-web-devicons")
require("plugins.telescope")
require("plugins.nvim-cmp")
require("plugins.nvim-tree")
--require("plugins.oil")
require("plugins.toggleterm")

require("plugins.lsp.mason")
require("plugins.lsp.lspsaga")
require("plugins.lsp.lspconfig")
