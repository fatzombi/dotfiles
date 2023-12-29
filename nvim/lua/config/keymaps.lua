require("util.zettelkasten")

local mapkey = require("util.keymapper").mapkey

-- Buffer Navigation
mapkey("<leader>bn", "bnext", "n") -- Next buffer
mapkey("<leader>bp", "bprevious", "n") -- Prev buffer
mapkey("<leader>bb", "e #", "n") -- Switch to Other Buffer
mapkey("<leader>`", "e #", "n") -- Switch to Other Buffer

-- Directory Navigation
mapkey("<leader>m", "NvimTreeFocus", "n")
mapkey("<leader>e", "NvimTreeToggle", "n")

-- Pane and Window Navigation
mapkey("<C-h>", "<C-w>h", "n") -- Navigate Left
mapkey("<C-j>", "<C-w>j", "n") -- Navigate Down
mapkey("<C-k>", "<C-w>k", "n") -- Navigate Up
mapkey("<C-l>", "<C-w>l", "n") -- Navigate Right
mapkey("<C-h>", "wincmd h", "t") -- Navigate Left
mapkey("<C-j>", "wincmd j", "t") -- Navigate Down
mapkey("<C-k>", "wincmd k", "t") -- Navigate Up
mapkey("<C-l>", "wincmd l", "t") -- Navigate Right
mapkey("<C-h>", "TmuxNavigateLeft", "n") -- Navigate Left
mapkey("<C-j>", "TmuxNavigateDown", "n") -- Navigate Down
mapkey("<C-k>", "TmuxNavigateUp", "n") -- Navigate Up
mapkey("<C-l>", "TmuxNavigateRight", "n") -- Navigate Right

-- Window Management
mapkey("<leader>sv", "vsplit", "n") -- Split Vertically
mapkey("<leader>sh", "split", "n") -- Split Horizontally

-- Indenting
mapkey("<", "v", "<gv") -- Shift Indentation to Left
mapkey(">", "v", ">gv") -- Shift Indentation to Right

-- Show Full File-Path
mapkey("<leader>pa", "echo expand('%:p')", "n") -- Show Full File Path

local api = vim.api

-- Zen Mode
api.nvim_set_keymap("n", "<leader>zm", ":ZenMode<CR>", {})

-- Comments
api.nvim_set_keymap("n", "<C-_>", "gtc", { noremap = false })
api.nvim_set_keymap("v", "<C-_>", "goc", { noremap = false })

-- "Zettlekasten"
api.nvim_set_keymap("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>", {})
api.nvim_set_keymap("n", "<leader>zn", "<cmd>Telekasten new_note<CR>", {})
api.nvim_set_keymap("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>", {})
api.nvim_set_keymap("n", "<leader>zg", "<cmd>Telekasten follow_link<CR>", {})

-- LazyGit
api.nvim_set_keymap("n", "<leader>gg", ":LazyGit<CR>", {})

--api.nvim_set_keymap("n", "<leader>nn", [[:lua create_zettelkasten_file()<CR>]], { noremap = true, silent = true })
--api.nvim_set_keymap("n", "<leader>nd", [[:lua create_or_open_daily_note()<CR>]], { noremap = true, silent = true })

-- Markdown
api.nvim_set_keymap("n", "<leader>np", ":Glow<CR>", {})
