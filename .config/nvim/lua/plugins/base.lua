return {
  { "AndrewRadev/splitjoin.vim" },
  -- { "tpope/vim-dadbod" },
  -- { "kristijanhusak/vim-dadbod-completion" },
  -- { "kristijanhusak/vim-dadbod-ui" },
  -- { "michaeljsmith/vim-indent-object" },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "tokyonight-night",
  --   },
  -- },
  {
    "zbirenbaum/copilot.lua",
    opts = {
      panel = { enabled = true },
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        ghost_text = { enabled = false },
      },
      keymap = {
        preset = "default",
        -- preset = "super-tab",
      },
    },
  },
  {
    "olimorris/codecompanion.nvim",
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("codecompanion").setup({
        strategies = {
          chat = {
            adapter = "copilot",
            tools = {
              ["mcp"] = {
                -- calling it in a function would prevent mcphub from being loaded before it's needed
                callback = function() return require("mcphub.extensions.codecompanion") end,
                description = "Call tools and resources from the MCP Servers",
              }
            }
          },
          inline = {
            adapter = "copilot",
          },
        },
        adapters = {
          openrouter = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              env = {
                url = "https://openrouter.ai/api",
                api_key = "OPENROUTER_API_KEY",
                chat_url = "/v1/chat/completions",
              },
              schema = {
                model = {
                  default = "google/gemini-2.5-pro-preview-03-25",
                },
              },
            })
          end,
        },
      })
    end,
  },
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- Required for Job and HTTP requests
    },
    -- comment the following line to ensure hub will be ready at the earliest
    cmd = "MCPHub",  -- lazy load by default
    -- build = "npm install -g mcp-hub@latest",  -- Installs required mcp-hub npm module
    -- uncomment this if you don't want mcp-hub to be available globally or can't use -g
    build = "bundled_build.lua",  -- Use this and set use_bundled_binary = true in opts  (see Advanced configuration)
    config = function()
      require("mcphub").setup({
        use_bundled_binary = true,
        extensions = {
          codecompanion = {
            -- Show the mcp tool result in the chat buffer
            show_result_in_chat = false,
            make_vars = true, -- make chat #variables from MCP server resources
            make_slash_commands = true, -- make /slash_commands from MCP server prompts
          },
        }
      })
    end,
  }
}
