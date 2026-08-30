-- NEW_WORKSPACE = "~/.config/hypr/script/launch-on-new-workspace.sh "

MAIN_MOD = "SUPER"
TERMINAL = "kitty"
FILE_MANAGER = TERMINAL .. " -e yazi"
-- MENU = "rofi -modi drun,calc -show"
-- BROWSER_PRIV = "flatpak run app.zen_browser.zen --private-window"

require("custom.keybinds")
require("custom.appearance")
require("custom.autostart")

---- MONITORS ----
hl.monitor({
    output = "",
    mode = "1920x1080@60",
    position = "auto",
    scale = "1",
})

---- INPUT ----
hl.config({
    input = {
        kb_layout = "pl",
        follow_mouse = 1,
        sensitivity = 0,

        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

---- WINDOWS AND WORKSPACES ----
hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },

    no_focus = true,
})
