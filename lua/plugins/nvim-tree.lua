local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
    return
end

-- recommend settings for nvim-tree docs
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
})
