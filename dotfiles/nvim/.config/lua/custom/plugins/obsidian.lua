return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
    'nvim-telescope/telescope.nvim',
    'echasnovski/mini.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    { '<leader>of', '<cmd>ObsidianQuickSwitch<CR>', desc = '[O]bsidian [f]ile' },
    { '<leader>ooi', '<cmd>ObsidianQuickSwitch inbox<CR>', desc = '[O]bsidian [O]pen [i]nbox' },
    { '<leader>ooW', '<cmd>ObsidianQuickSwitch Waiting<CR>', desc = '[O]bsidian [O]pen [W]aiting' },
    { '<leader>ooh', '<cmd>ObsidianQuickSwitch Home<CR>', desc = '[O]bsidian [O]pen [H]ome' },
    { '<leader>oow', '<cmd>ObsidianQuickSwitch Work<CR>', desc = '[O]bsidian [O]pen [W]ork' },
    { '<leader>ooe', '<cmd>ObsidianQuickSwitch Evening TODO<CR>', desc = '[O]bsidian [O]pen [E]vening TODO' },
    { '<leader>ot', '<cmd>ObsidianToday<CR>', desc = '[O]bsidian [t]oday' },
    { '<leader>oy', '<cmd>ObsidianYesterday<CR>', desc = '[O]bsidian [y]esterday' },
    { '<leader>on', '<cmd>ObsidianTomorrow<CR>', desc = '[O]bsidian [N]ext day' },
    { '<leader>og', '<cmd>ObsidianSearch<CR>', desc = '[O]bsidian [g]rep' },
    { '<leader>ob', '<cmd>ObsidianBacklinks<CR>', desc = '[O]bsidian [b]acklinks' },
    { '<leader>op', '<cmd>ObsidianTemplate<CR>', desc = '[O]bsidian tem[p]late' },
    { '<leader>sn', '<cmd>ObsidianQuickSwitch<CR>', desc = '[S]earch [N]otes' },
    { '<leader>so', '<cmd>ObsidianQuickSwitch<CR>', desc = '[S]earch [O]bsidian' },

    {
      '<leader>oc',
      function()
        return require('obsidian').util.toggle_checkbox()
      end,
      desc = '[O]bsidian toggle checkbox',
    },
  },
  mappings = {
    -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
    ['gf'] = {
      action = function()
        return require('obsidian').util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
    -- Smart action depending on context, either follow link or toggle checkbox.
    ['<leader>os'] = {
      action = function()
        return require('obsidian').util.smart_action()
      end,
      opts = { buffer = true, expr = true },
    },
  },
  opts = {
    ui = {
      enable = true, -- set to false to disable all additional syntax features
      update_debounce = 200, -- update delay after a text change (in milliseconds)
      max_file_length = 5000, -- disable UI features for files with more than this many lines
      -- Define how various check-boxes are displayed
      checkboxes = {
        -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
        [' '] = { char = '󰄱', hl_group = 'ObsidianTodo' },
        ['x'] = { char = '', hl_group = 'ObsidianDone' },
        ['>'] = { char = '', hl_group = 'ObsidianRightArrow' },
        ['~'] = { char = '󰰱', hl_group = 'ObsidianTilde' },
        ['!'] = { char = '', hl_group = 'ObsidianImportant' },
        -- Replace the above with this if you don't have a patched font:
        -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
        -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

        -- You can also add more custom ones...
      },
      -- Use bullet marks for non-checkbox lists.
      bullets = { char = '•', hl_group = 'ObsidianBullet' },
      external_link_icon = { char = '', hl_group = 'ObsidianExtLinkIcon' },
      -- Replace the above with this if you don't have a patched font:
      -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      reference_text = { hl_group = 'ObsidianRefText' },
      highlight_text = { hl_group = 'ObsidianHighlightText' },
      tags = { hl_group = 'ObsidianTag' },
      block_ids = { hl_group = 'ObsidianBlockID' },
      hl_groups = {
        -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
        ObsidianTodo = { bold = true, fg = '#f78c6c' },
        ObsidianDone = { bold = true, fg = '#89ddff' },
        ObsidianRightArrow = { bold = true, fg = '#f78c6c' },
        ObsidianTilde = { bold = true, fg = '#ff5370' },
        ObsidianImportant = { bold = true, fg = '#d73128' },
        ObsidianBullet = { bold = true, fg = '#89ddff' },
        ObsidianRefText = { underline = true, fg = '#c792ea' },
        ObsidianExtLinkIcon = { fg = '#c792ea' },
        ObsidianTag = { italic = true, fg = '#89ddff' },
        ObsidianBlockID = { italic = true, fg = '#89ddff' },
        ObsidianHighlightText = { bg = '#75662e' },
      },
    },
    workspaces = {
      {
        name = 'vault',
        path = '~/Workspace/coryleeio/Scratch',
      },
    },
    notes_subdir = 'slipbox',
    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = 'journal/daily',
    },
    -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
    completion = {
      -- Set to false to disable completion.
      nvim_cmp = true,
      -- Trigger completion at 2 chars.
      min_chars = 2,
    },
    new_notes_location = 'notes_subdir',

    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
      name = 'telescope.nvim',
      -- Optional, configure key mappings for the picker. These are the defaults.
      -- Not all pickers support all mappings.
      note_mappings = {
        -- Create a new note from your query.
        new = '<C-x>',
        -- Insert a link to the selected note.
        insert_link = '<C-l>',
      },
      tag_mappings = {
        -- Add tag(s) to current note.
        tag_note = '<C-x>',
        -- Insert a tag at the current location.
        insert_tag = '<C-l>',
      },
    },
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      return title
    end,
    sort_by = 'modified',
    sort_reversed = true,
    attachments = {
      img_folder = 'slipbox/files',
    },

    -- Optional, customize how note file names are generated given the ID, target directory, and title.
    ---@param spec { id: string, dir: obsidian.Path, title: string|? }
    ---@return string|obsidian.Path The full path to the new note.
    note_path_func = function(spec)
      -- This is equivalent to the default behavior.
      local path = spec.dir / spec.title
      return path:with_suffix '.md'
    end,

    -- change which program is called to open lines being hovered on depending on operating system
    follow_url_func = function(url)
      local opencmd
      if vim.loop.os_uname().sysname == 'Linux' then
        opencmd = 'xdg-open'
      else
        opencmd = 'open'
      end
      vim.fn.jobstart { opencmd, url }
    end,
    disable_frontmatter = true,
  },
}
