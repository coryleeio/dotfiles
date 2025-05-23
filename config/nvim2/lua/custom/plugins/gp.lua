-- ChatGPT like sessions, Instructable text/code operations, Speech to text and Image generation in your favorite editor.
return {
  'robitx/gp.nvim',
  config = function()
    local conf = {
      -- For customization, refer to Install > Configuration in the Documentation/Readme
      --
      providers = {
        openai = {
          endpoint = 'https://api.openai.com/v1/chat/completions',
          secret = os.getenv 'OPENAI_API_KEY',
        },
        copilot = {
          endpoint = 'https://api.githubcopilot.com/chat/completions',
          secret = {
            'bash',
            '-c',
            "cat ~/.config/github-copilot/hosts.json | sed -e 's/.*oauth_token...//;s/\".*//'",
          },
        },
        ollama = {
          endpoint = 'http://localhost:11434/v1/chat/completions',
        },
        anthropic = {
          endpoint = 'https://api.anthropic.com/v1/messages',
          secret = os.getenv 'ANTHROPIC_API_KEY',
        },
      },
      agents = {
        {
          name = 'llama3',
          chat = true,
          command = true,
          provider = 'ollama',
          model = { model = 'llama3' },
          system_prompt = 'I am an AI meticulously crafted to provide programming guidance and code assistance. '
            .. 'To best serve you as a computer programmer, please provide detailed inquiries and code snippets when necessary, '
            .. 'and expect precise, technical responses tailored to your development needs.\n',
        },
      },
    }
    require('gp').setup(conf)

    -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
  end,
}
