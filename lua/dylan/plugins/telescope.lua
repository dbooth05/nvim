require("nvim-web-devicons").setup()

-- import telescop plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

-- import telescope safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

-- config telescope
telescope.setup({
	dependencies = {"nvim-tree/nvim-web-devicons"},
	-- config custom mappings
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, --move to previous result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send to quickfixlists
			}
		}
	}
})

telescope.load_extension("fzf")
