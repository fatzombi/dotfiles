require("obsidian").setup({
  workspaces = {
    {
        name = "default",
        path = "/Users/fatzombi/Documents/Obsidian Vault",
      },
  },
  notes_subdir = "inbox",
  new_notes_location = "notes_subdir",


  disable_frontmatter = true,
  templates = {
      subdir = "Assets/Templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M:%S",
      substitutions = {
      yesterday = function()
        return os.date("%Y-%m-%d", os.time() - 24 * 60 * 60)
      end,
      yesterday_link = function()
        return os.date("Daily Notes/%Y/%B/%Y-%m-%d|%Y-%m-%d", os.time() - 24 * 60 * 60)
      end,
      tomorrow = function()
        return os.date("%Y-%m-%d", os.time() + 24 * 60 * 60)
      end,
      tomorrow_link = function()
        return os.date("Daily Notes/%Y/%B/%Y-%m-%d|%Y-%m-%d", os.time() + 24 * 60 * 60)
      end,
    }
  },
  daily_notes = {
    -- Optional, if you keep daily notes in a separate directory.
    folder = "Daily Notes",
    -- Optional, if you want to change the date format for the ID of daily notes.
    date_format = "%Y/%B/%Y-%m-%d",
    -- Optional, if you want to change the date format of the default alias of daily notes.
    alias_format = "%B %-d, %Y",
    -- Optional, default tags to add to each new daily note created.
    default_tags = { "daily-notes" },
    -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
    template = "Daily Note Template.md",
  },

  -- name new notes starting the ISO datetime and ending with note name
  -- put them in the inbox subdir
  -- note_id_func = function(title)
  --   local suffix = ""
  --   -- get current ISO datetime with -5 hour offset from UTC for EST
  --   local current_datetime = os.date("!%Y-%m-%d-%H%M%S", os.time() - 5*3600)
  --   if title ~= nil then
  --     suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
  --   else
  --     for _ = 1, 4 do
  --       suffix = suffix .. string.char(math.random(65, 90))
  --     end
  --   end
  --   return current_datetime .. "_" .. suffix
  -- end,

  -- key mappings, below are the defaults
  mappings = {
    -- overrides the 'gf' mapping to work on markdown/wiki links within your vault
    ["gf"] = {
      action = function()
        return require("obsidian").util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
    -- toggle check-boxes
    ["<leader>ti"] = {
      action = function()
        return require("obsidian").util.toggle_checkbox()
      end,
      opts = { buffer = true },
    },
  },
  completion = {
    nvim_cmp = true,
    min_chars = 2,
  },
  ui = {
    -- Disable some things below here because I set these manually for all Markdown files using treesitter
    checkboxes = { },
    bullets = {  },
  },
})
