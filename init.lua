require("plugins-setup")

-- setting up options
require("core.options")
require("core.keymaps")
require("core.colorscheme")


require("plugins.nvim-web-devicons")
require("plugins.telescope")
require("plugins.nvim-cmp")
require("plugins.nvim-tree")

require("plugins.lsp.lspconfig")

require("diffview").setup({debug_mode = true,})
