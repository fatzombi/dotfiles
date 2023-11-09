local opts = {
	ensure_installed = {
		"efm",
		"bashls",
		"tsserver",
		"solidity",
		"tailwindcss",
		"pyright",
		"html",
		"cssls",
		"lua_ls",
		"emmet_ls",
		"jsonls",
    "csharp-language-server",
    "csharpier",
    "omnisharp",
    "docker-compose-language-service",
    "dockerfile-language-server",
    "jsonlint",
    "jq",
    "markdownlint",
    "python-lsp-server",
    "reorder-python-imports",
    "ruby-lsp",
    "semgrep",
    "sql-formatter",
    "yaml-language-server",
	},

	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}
