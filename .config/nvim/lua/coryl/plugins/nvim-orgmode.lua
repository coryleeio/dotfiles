return {
  "nvim-orgmode/orgmode",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter", lazy = true },
  },
  event = "VeryLazy",
  config = function()
    -- Load treesitter grammar for org
    require("orgmode").setup_ts_grammar()

    -- Setup treesitter
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "org" },
      },
      ensure_installed = { "org" },
    })

    -- Setup orgmode
    require("orgmode").setup({
      win_split_mode = "vertical",
      org_agenda_files = { "~/Workspace/coryleeio/Scratch/orgfiles/org/*" },
      org_default_notes_file = vim.fn.expand("$HOME/Workspace/coryleeio/Scratch/orgfiles/refile.org"),
    })
  end,
}
