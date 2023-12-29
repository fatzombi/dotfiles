local config = function()
	require("lualine").setup({
		options = {
			theme = 'palenight',
			globalstatus = true,
		},
		tabline = {
			lualine_a = { "mode" },
			lualine_b = { "buffers" },
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress", "location" },
			lualine_z = {
        {
          function()
            local words = vim.fn.wordcount()['words']
            return 'Words: ' .. words
          end,
          cond = function()
            local ft = vim.opt_local.filetype:get()
            local count = {
                  latex = true,
                  tex = true,
                  text = true,
                  markdown = true,
                  vimwiki = true,
              }
              return count[ft] ~= nil
          end,
        }
      },
		},
		sections = {},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = config,
}
