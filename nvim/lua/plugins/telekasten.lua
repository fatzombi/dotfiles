local home = vim.fn.expand("~/src/zet")
return {
	"renerocksai/telekasten.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	opts = {
		home = home,
		dailies = home .. "/" .. "03 logs",
		extension = ".md",
		new_note_location = "smart",
		new_note_filename = "title",
		uuid_type = "%Y%m%d%H%M",
		uuid_sep = "-",
		journal_auto_open = true,
		template_new_daily = home .. "/" .. "05 Meta/Daily Note Template.md",
		template_new_note = home .. "/" .. "05 Meta/Default Note Template.md",
	},
}
