-- Function to create a Zettelkasten file with current datetime
function create_zettelkasten_file()
    local current_datetime = os.date("%Y%m%d%H%M%S")
    local filename = vim.fn.input("Enter Zettelkasten title: ", current_datetime .. "_")

    -- Set the directory where you want to create the file
    local zettelkasten_dir = "~/src/zet/00 inbox/"
    local full_path = zettelkasten_dir .. filename .. ".md"

    -- Create the file and open it
    vim.cmd("edit " .. full_path)

    -- You can also add some default content if you want
    vim.api.nvim_buf_set_lines(0, 0, -1, false, {"# " .. filename, ""})
end

-- Function to create or open a daily note file
function create_or_open_daily_note()
    local current_date = os.date("%Y-%m-%d")
    local full_path = vim.fn.expand("~/src/zet/03 logs/") .. current_date .. ".md"

    -- Check if the file exists using v:shell_error
    local file_exists = vim.fn.system(string.format("[ -e %s ]", vim.fn.shellescape(full_path))) == 0

    vim.cmd("edit " .. full_path)

    if not file_exists then
        -- You can add some default content if you want
        vim.api.nvim_buf_set_lines(0, 0, -1, false, {"# Daily Note - " .. current_date, ""})
    end
end

-- Map the function to a key combination (e.g., <Leader>nn)
vim.api.nvim_set_keymap('n', '<Leader>nn', [[:lua create_or_open_daily_note()<CR>]], { noremap = true, silent = true })

