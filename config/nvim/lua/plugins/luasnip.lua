return {
  "L3MON4D3/LuaSnip",
  lazy = true,
  build = (not LazyVim.is_win())
      and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
    or nil,
  dependencies = {
    {
      "coryleeio/snippets",
      version = false, -- always grab latest commit
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
      end,
    },
  },
  opts = function()
    LazyVim.cmp.actions.snippet_forward = function()
      if require("luasnip").jumpable(1) then
        vim.schedule(function()
          require("luasnip").jump(1)
        end)
        return true
      end
    end
    LazyVim.cmp.actions.snippet_stop = function()
      if require("luasnip").expand_or_jumpable() then -- or just jumpable(1) is fine?
        require("luasnip").unlink_current()
        return true
      end
    end
  end,
}
