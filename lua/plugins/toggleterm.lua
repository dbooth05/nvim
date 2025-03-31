local setup, toggleterm = pcall(require, "toggleterm")
if not setup then
    return
end

toggleterm.setup({
    open_mapping = [[<C-t>]],
    direction = "float", -- or "horizontal" / "vertical"
})
