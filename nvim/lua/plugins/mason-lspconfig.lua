local opts = {
	ensure_installed = {
		"efm",
		"bashls",
		"tsserver",
		"pyright",
		"html",
		"cssls",
		"lua_ls",
		"emmet_ls",
		"jsonls",
		"csharp_ls",
		"dockerls",
		"marksman",
    "omnisharp",
    "gopls"
	},

	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}
