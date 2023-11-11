return {
  "renerocksai/telekasten.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    local telekasten = require("telekasten")

    telekasten.setup({
      home = vim.fn.expand("$HOME/Workspace/coryleeio/Scratch/"),
      dailies = vim.fn.expand("$HOME/Workspace/coryleeio/Scratch/Updates/Dailies/"),
      weeklies = vim.fn.expand("$HOME/Workspace/coryleeio/Scratch/Updates/Weeklies/"),
    })

    local keymap = vim.keymap -- for conciseness
    -- Launch panel if nothing is typed after <leader>z
    -- vim.keymap.set("n", "<leader>z", "<cmd>Telekasten panel<cr>", { desc = "Fuzzy find files in cwd" })

    -- Most used functions
    vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<cr>", { desc = "Fuzzy find notes" })
    vim.keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<cr>", { desc = "Fuzzy search notes" })
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
