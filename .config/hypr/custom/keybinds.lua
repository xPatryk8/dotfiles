-- Apps
hl.bind(MAIN_MOD .. " + Q", hl.dsp.exec_cmd(TERMINAL))
hl.bind(MAIN_MOD .. " + space", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))
hl.bind("HOME", hl.dsp.exec_cmd("noctalia msg panel-toggle control-center"))
hl.bind(MAIN_MOD .. " + apostrophe", hl.dsp.exec_cmd("noctalia msg session lock"))
hl.bind(MAIN_MOD .. " + period", hl.dsp.exec_cmd("noctalia msg panel-toggle wallpaper"))

hl.bind(MAIN_MOD .. "+ S", hl.dsp.workspace.toggle_special("terminal"))
hl.bind(MAIN_MOD .. "+ X", hl.dsp.workspace.toggle_special("btop"))
hl.bind(MAIN_MOD .. "+ E", hl.dsp.workspace.toggle_special("file_manager"))
hl.bind(MAIN_MOD .. "+ M", hl.dsp.workspace.toggle_special("music"))

hl.bind(MAIN_MOD .. " + B", hl.dsp.exec_cmd(NEW_WORKSPACE .. BROWSER_PRIV))

hl.bind("Print", hl.dsp.exec_cmd("flameshot gui"), { locked = true })

hl.bind(MAIN_MOD .. " + P", hl.dsp.window.pin())

-- Workspaces auto run
local workspaces_on_empty = {
  ["special:terminal"] = {TERMINAL},
  ["special:btop"] = {TERMINAL .. " -e btop"},
  ["special:file_manager"] = {FILE_MANAGER},
  ["special:music"] = {"youtube-music"}
}

hl.on("workspace.created", function(ws)
  if not ws.is_empty then return end

  local program = ws.id and workspaces_on_empty[tostring(ws.id)] or workspaces_on_empty[ws.name]
  if program == nil then return end

  local cmd, provided_rules = table.unpack(program)
  local rules = {}
  if provided_rules ~= nil then
    for k, v in provided_rules do rules[k] = v end
  end

  rules.workspace = (ws.id and tostring(ws.id) or ws.name) .. " silent"
  hl.exec_cmd(cmd, rules)
end)

-- General
hl.bind(MAIN_MOD .. " + C", hl.dsp.window.close())
hl.bind(
	MAIN_MOD .. " + F12",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(MAIN_MOD .. " + V", hl.dsp.window.float({ action = "toggle" }))
-- hl.bind(MAIN_MOD .. " + T", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind("Pause", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true }) -- Mute mic globally

-- Move focus
hl.bind(MAIN_MOD .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(MAIN_MOD .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(MAIN_MOD .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(MAIN_MOD .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(MAIN_MOD .. " + F", hl.dsp.window.fullscreen())

-- Workspaces
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(MAIN_MOD .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(MAIN_MOD .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(MAIN_MOD .. " + bracketleft", hl.dsp.focus({ workspace = "-1" }))
hl.bind(MAIN_MOD .. " + bracketright", hl.dsp.focus({ workspace = "+1" }))

-- Move/resize windows
hl.bind(MAIN_MOD .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(MAIN_MOD .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- hl.bind(MAIN_MOD .. " + CTRL + H", hl.dsp.window.resize({ x = -80, y = 0, relative = true }))
-- hl.bind(MAIN_MOD .. " + CTRL + L", hl.dsp.window.resize({ x = 80, y = 0, relative = true }))
-- hl.bind(MAIN_MOD .. " + CTRL + K", hl.dsp.window.resize({ x = 0, y = -80, relative = true }))
-- hl.bind(MAIN_MOD .. " + CTRL + J", hl.dsp.window.resize({ x = 0, y = 80, relative = true }))

hl.bind(MAIN_MOD .. " + CTRL + H", hl.dsp.layout("colresize -0.15"))
hl.bind(MAIN_MOD .. " + CTRL + L", hl.dsp.layout("colresize +0.15"))

hl.bind(MAIN_MOD .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(MAIN_MOD .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))


-- hl.bind(MAIN_MOD .. " + SHIFT + H", hl.dsp.layout("swapcol l"))
-- hl.bind(MAIN_MOD .. " + SHIFT + L", hl.dsp.layout("swapcol r"))
-- -- hl.bind(MAIN_MOD .. " + SHIFT + L", hl.dsp.window.swap({ direction = "r" }))
-- hl.bind(MAIN_MOD .. " + SHIFT + K", hl.dsp.window.swap({ direction = "u" }))
-- hl.bind(MAIN_MOD .. " + SHIFT + J", hl.dsp.window.swap({ direction = "d" }))
-- hl.bind(MAIN_MOD .. " +  I", hl.dsp.layout("move +100"))

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
