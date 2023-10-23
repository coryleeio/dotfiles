return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local transform_mod = require('telescope.actions.mt').transform_mod
    local actions = require("telescope.actions")
    local mod = {}
    mod.open_in_nvim_tree = function(prompt_bufnr)
      local cur_win = vim.api.nvim_get_current_win()
      vim.cmd("NvimTreeFindFile")
      vim.api.nvim_set_current_win(cur_win)
    end
    mod = transform_mod(mod)

    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<CR>"] = actions.select_default + mod.open_in_nvim_tree,
          },

          n = {
            ["<CR>"] = actions.select_default + mod.open_in_nvim_tree,
          },
        },
      },
    }),

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
  end,
}
