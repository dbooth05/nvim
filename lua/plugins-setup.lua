-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand to reload neovim and install/update/remove plugins
-- when file is saved
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
	augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- add list of plugins to install
return packer.startup(function(use)
	--packer can manage itself
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim") -- required dependency for many things

    use{ "catppuccin/nvim", as="catppuccin" } -- color theme

    use("szw/vim-maximizer") -- max current window

    use("numToStr/Comment.nvim") -- comments using gc

	use("nvim-tree/nvim-web-devicons")

    use("nvim-tree/nvim-tree.lua") -- file explorer

    use("nvim-lualine/lualine.nvim") -- better status bar (bottom)

    --use("echasnovski/mini.icons") -- mini.icons plugin

    use("stevearc/oil.nvim") -- oil plugin for creating files...

	use({   -- autocloses (), {}, [], '', "", ...
		"m4xshen/autoclose.nvim",
		config = function()
			require("autoclose").setup()
		end
	})

	-- fuzzy find
	use({"nvim-telescope/telescope-fzf-native.nvim", run="make"})
	use({"nvim-telescope/telescope.nvim", branch="0.1.x"})

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	--snippets
	use({
        "L3MON4D3/LuaSnip",
        config = function()
            enable_jsregexp = true
        end
    }) -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippet

	-- manage & install lsp servers, linters, & formatters
	use {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    }
	use("williamboman/mason-lspconfig.nvim") -- bridge gap b/w mason & lspconfig

    -- terminal build into nvim
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}

	-- config lsp server
	use("neovim/nvim-lspconfig") -- easily config lang server
	use("hrsh7th/cmp-nvim-lsp") -- for autocomplete
	use({
		"glepnir/lspsaga.nvim",
		branch="main",
		requires={
			{"nvim-tree/nvim-web-devicons"},
			{"nvim-treesitter/nvim-treesitter"},
		},
	}) -- enhanced lsp uis

    -- difview
    use("sindrets/diffview.nvim")

	use("onsails/lspkind.nvim") -- vscode like icons for autocomplete

	if packer_bootstrap then
		require("packer").sync()
	end
end)
