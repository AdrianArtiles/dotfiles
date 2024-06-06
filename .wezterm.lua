local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

config.enable_scroll_bar = false
config.color_scheme = 'Default Dark (base16)'
-- config.color_scheme = 'Default Light (base16)'
-- config.color_scheme = 'GruvboxDarkHard'
-- config.force_reverse_video_cursor = true
config.window_decorations = 'RESIZE'
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.tab_bar_at_bottom=true

config.hide_tab_bar_if_only_one_tab = true

config.mouse_bindings = {
  -- Change the default click behavior so that it only selects
  -- text and doesn't open hyperlinks
  -- {
  --   event = { Up = { streak = 1, button = 'Left' } },
  --   mods = 'NONE',
  --   action = act.CompleteSelection 'ClipboardAndPrimarySelection',
  -- },

  -- and make CTRL-Click open hyperlinks
  -- {
  --   event = { Up = { streak = 1, button = 'Left' } },
  --   mods = 'CMD',
  --   action = act.OpenLinkAtMouseCursor,
  -- },
  -- NOTE that binding only the 'Up' event can give unexpected behaviors.
}

return config
