return {
  "renerocksai/telekasten.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    local telekasten = require("telekasten")

    telekasten.setup({
      home = vim.fn.expand("$HOME/Workspace/coryleeio/Scratch/"),
      dailies = vim.fn.expand("$HOME/Workspace/coryleeio/Scratch/Updates/Standup/"),
      weeklies = vim.fn.expand("$HOME/Workspace/coryleeio/Scratch/Updates/Weekly/"),

      follow_creates_nonexisting = true,
      dailies_create_nonexisting = true,
      weeklies_create_nonexisting = true,

      -- template for newly created daily notes (goto_today)
      -- set to `nil` or do not specify if you do not want a template
      template_new_daily = vim.fn.expand("$HOME/Workspace/coryleeio/Scratch/Templates/standup.md"),

      -- template for newly created weekly notes (goto_thisweek)
      -- set to `nil` or do not specify if you do not want a template
      template_new_weekly = vim.fn.expand("$HOME/Workspace/coryleeio/Scratch/Templates/weekly.md"),
      template_handling = "smart",
      -- should all links be updated when a file is renamed
      rename_update_links = true,

      -- integrate with calendar-vim
      plug_into_calendar = false,
      calendar_opts = {
        -- calendar week display mode: 1 .. 'WK01', 2 .. 'WK 1', 3 .. 'KW01', 4 .. 'KW 1', 5 .. '1'
        weeknm = 4,
        -- use monday as first day of week: 1 .. true, 0 .. false
        calendar_monday = 1,
        -- calendar mark: where to put mark for marked days: 'left', 'right', 'left-fit'
        calendar_mark = "left-fit",
      },
    })

    local keymap = vim.keymap -- for conciseness
    -- Launch panel if nothing is typed after <leader>z
    -- vim.keymap.set("n", "<leader>z", "<cmd>Telekasten panel<cr>", { desc = "Fuzzy find files in cwd" })

    -- Most used functions
    vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<cr>", { desc = "Fuzzy find notes" })
    vim.keymap.set("n", "<leader>zs", "<cmd>Telekasten search_notes<cr>", { desc = "Fuzzy search notes" })
    vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<cr>", { desc = "Go to daily note" })
    vim.keymap.set("n", "<leader>zw", "<cmd>Telekasten goto_thisweek<cr>", { desc = "Go to weekly note" })
    vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten follow_link<cr>", { desc = "Follow note link" })
    vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<cr>", { desc = "Create new note" })
    vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<cr>", { desc = "Show Calendar" })
    vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<cr>", { desc = "Show Backlinks" })
    vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<cr>", { desc = "Insert Image Link" })

    -- Call insert link automatically when we start typing a link
    vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<cr>")
  end,
}
