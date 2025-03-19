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
}
