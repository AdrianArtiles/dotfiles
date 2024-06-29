local wezterm = require 'wezterm'
-- local act = wezterm.action
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

-- config.window_padding = {
--   left = 0,
--   right = 0,
--   top = 0,
--   bottom = 0,
-- }

-- local function dynamic_padding(window, pane)
--   -- Detect if Neovim is running by inspecting the foreground process name or arguments
--   local process = pane:get_foreground_process_info()
--   if process and string.find(process.name, "nvim") then
--     -- Neovim is running, remove padding
--     -- return { left = 0, right = 0, top = 0, bottom = 0 }
--     config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
--   else
--     -- Neovim is not running, use default padding
--     -- return { left = 5, right = 5, top = 5, bottom = 5 }
--     config.window_padding = { left = 5, right = 5, top = 5, bottom = 5 }
--   end
-- end

local function dynamic_padding(window, pane)
  local overrides = window:get_config_overrides() or {}
  -- if not overrides.harfbuzz_features then
  --   -- If we haven't overridden it yet, then override with ligatures disabled
  --   overrides.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
  -- else
  --   -- else we did already, and we should disable out override now
  --   overrides.harfbuzz_features = nil
  -- end
  -- overrides.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

  local process = pane:get_foreground_process_info()
  if process and (string.find(process.name, "nvim") or string.find(process.name, "tmux")) then
    -- Neovim is running, remove padding
    -- return { left = 0, right = 0, top = 0, bottom = 0 }
    -- config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
    overrides.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
  else
    -- Neovim is not running, use default padding
    -- return { left = 5, right = 5, top = 5, bottom = 5 }
    -- overrides.window_padding = { left = 5, right = 5, top = 5, bottom = 5 }
    -- overrides.window_padding = { left = 20, right = 20, top = 20, bottom = 20 }
    overrides.window_padding = {  }
    -- overrides.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
  end

  window:set_config_overrides(overrides)
end
wezterm.on("update-right-status", dynamic_padding)

return config
