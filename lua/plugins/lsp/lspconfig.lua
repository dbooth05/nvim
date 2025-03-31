-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return
end

local keymap = vim.keymap

-- enable keybinds for available lsp server
local on_attach = function(client, bufr)
end

-- set keybinds
keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)											-- show definition, references
keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)						-- got to declaration
keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)									-- see definition and make edits in window
keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)				-- go to implementation
keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)							-- see available code actions
keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)									-- smart rename
keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)		-- show  diagnostics for line
keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)	-- show diagnostics for cursor
keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)						-- jump to previous diagnostic in buffer
keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)						-- jump to next diagnostic in buffer
keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)												-- show documentation for what is under cursor
keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)									-- see outline on right hand side

local capabilities = cmp_nvim_lsp.default_capabilities()

local on_attach = function(client, bufnr)
  -- show diagnostics in a float on CursorHold
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      vim.diagnostic.open_float(nil, {
        focusable = false,
        border = "rounded",
        source = "always",
        prefix = "",
      })
    end,
  })
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

lspconfig["clangd"].setup({
	capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "c", "cpp", "objc", "objcpp" },
	cmd = {
		"clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=never",
    "--all-scopes-completion",
    "--pch-storage=memory",
    "--compile-commands-dir=build", -- Cmake stuff
    },
})

lspconfig["jdtls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = { "jdtls" }, -- Mason installs jdtls globally
	root_dir = require("lspconfig.util").root_pattern("pom.xml", "build.gradle", ".git"),
	settings = {
		java = {
			completion = {
				enabled = true
			},
			signatureHelp = {
				enabled = true
			},
			contentProvider = {
				preferred = "fernflower"
			}
		}
	},
})

lspconfig["ltex"].setup({
	capabilities = capabilities,
	on_attach = on_attach
})

lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach
})

lspconfig["pyright"].setup({
	capabilities = capabilities,
	on_attach = on_attach
})
