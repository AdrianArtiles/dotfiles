return {
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
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },
  {
    "folke/sidekick.nvim",
    keys = {
      { "<c-y>", LazyVim.cmp.map({ "ai_nes" }, "<c-y>"), mode = { "n" }, expr = true },
    },
    opts = {
      nes = { enabled = false },
      -- cli = {
      --   mux = {
      --     enabled = true,
      --     backend = "tmux",
      --   },
      -- },
    }
  },
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    dependencies = {
      "folke/snacks.nvim"
    },
    keys = {
      {
        "<leader>-",
        mode = { "n", "v" },
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        -- Open in the current working directory
        "<leader>cw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
      {
        "<c-up>",
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
  },
  {
          },
        },
  },
}
