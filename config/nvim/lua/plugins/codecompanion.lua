return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = function()
    local openai_api_key = os.getenv("OPENAI_API_KEY")

    if not openai_api_key or openai_api_key == "" then
      vim.notify("OPENAI_API_KEY not set. OpenAI adapter might not work.", vim.log.levels.WARN)
    end

    local openai_helper_config = { -- Renamed from openai_config to avoid confusion
      handlers = {}, -- Define actual handlers if needed by your setup or adapter base
      headers = {
        ["Authorization"] = "Bearer " .. (openai_api_key or ""),
        ["Content-Type"] = "application/json",
      },
    }

    local function adapter(base_name, url, model_name)
      local base_adapter_module = "codecompanion.adapters." .. base_name
      local base_ok, base = pcall(require, base_adapter_module)
      if not base_ok then
        vim.notify(
          "Failed to load base adapter: " .. base_adapter_module .. " (" .. tostring(base) .. ")",
          vim.log.levels.ERROR
        )
        return nil
      end

      local cc_adapters_module = require("codecompanion.adapters")
      if not cc_adapters_module or not cc_adapters_module.extend then
        vim.notify("codecompanion.adapters or extend function not found", vim.log.levels.ERROR)
        return nil
      end

      return cc_adapters_module.extend(base, {
        url = url,
        env = { api_key = openai_api_key },
        handlers = openai_helper_config.handlers,
        headers = openai_helper_config.headers,
        parameters = { model = "${model}" },
        schema = {
          model = {
            default = model_name or (base.schema and base.schema.model and base.schema.model.default),
          },
        },
      })
    end

    local configured_adapters = {}
    local chat_adapter_name_to_use = nil -- To hold the name if adapter is configured

    if openai_api_key and openai_api_key ~= "" then
      configured_adapters.claude = adapter(
        "openai",
        "https://llm-proxy.sandbox.indeed.net/bedrock/v1",
        "us.anthropic.claude-3-7-sonnet-20250219-v1:0"
      )
    else
      vim.notify("OpenAI adapters not configured due to missing API key.", vim.log.levels.INFO)
    end

    -- This is the table structure that LazyVim will pass to codecompanion.nvim's setup
    return {
      adapters = configured_adapters,
      strategies = {
        chat = {
          adapter = "claude",
        },
      },
      opts = {
        log_level = "INFO",
      },
    }
  end,
}
