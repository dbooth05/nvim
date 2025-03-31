-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
    return
end

-- import mason-lspconfig plugin safely
local mason_lsp_status, mason_lsp = pcall(require, "mason_lsp")
if not mason_lsp_status then
    return
end

mason.setup()

mason_lsp.setup({
    ensure_installed = {
        "letx",
        "clangd",
        "jdtls",
        "lua_ls",
        "pyright",
    }
})
