-- WINDOW, WORKSPACE AND LAYER RULES --
-- https://wiki.hypr.land/configuring/core/rules/
local defaults = require("config.user-defaults")
local monitors = require("config.monitors")                                                    -- Get monitor info for multi-monitor setups

-- Rounding and border rules
hl.window_rule({
    match       = { class = "^(zenity|yad)$" },
    rounding = 20
})

hl.window_rule({
    match       = { class = "vesktop", title = "vesktop" },
    rounding = 10
})
hl.window_rule({
    match       = { title = "^((?i)info|attention|error|warning|question|attention|confirm)$" },
    rounding = 20
})
hl.window_rule({
    match       = { class = "ONLYOFFICE" },
    rounding = 5
})
hl.window_rule({
    match       = { class = " ^(winboat-).*$" },
    rounding = 7
})

-- Floating rules
hl.window_rule({
    match       = { class = "^(?i)" .. defaults.fileManager .. "$",
                    title = "^((?i).*(operation|rename|copy|propert|mov|progress|confirm).*)$" },
    float = true
})
hl.window_rule({
    match       = { title = "^((?i).*(open|save).*)$" },
    float = true
})
hl.window_rule({
    match       = { class = "^(xdg-desktop-portal).*$" },
    float = true
})
hl.window_rule({
    match       = { class = "CachyOSHello" },
    float = true
})
hl.window_rule({
    match       = { class = "winecfg" },
    float  = true,
    center = true
})
hl.window_rule({
    match       = { class = "flameshot" },
    float  = true,
    center = true
})
hl.window_rule({
    match       = { title = "^((?i).*(settings|config|pref|options).*)$" },
    float       = true,
    center      = true
})
hl.window_rule({
    match       = { title = "Friends List" },
    float       = true,
    center      = true
})
hl.window_rule({
    match       = { modal = true },
    float  = true,
    center = true
})

-- Default apps rules
hl.window_rule({
    match       = { class = defaults.musicClass },
    float       = true,
    center      = true,
    size        = { 1400, 900 },
    workspace   = "special:musicPlayer"
})
hl.window_rule({
    match       = { class = defaults.messageClient },
    float       = true,
    center      = true,
    size        = { 1200, 800 },
    workspace   = "special:chat"
})
hl.window_rule({
    match       = { class = defaults.discordClient },
    float       = true,
    center      = true,
    size        = { 1500, 1000 },
    workspace   = "special:discordClient"
})
-- Noctalia rules
hl.window_rule({
    match = { class = "dev.noctalia.Noctalia" },
    float = true,
    size = { 1080, 920 },
})

-- Picture-In-Picture
hl.window_rule({
    match       = { class = "Picture-in-Picture" },
    float       = true,
    pin         = true,
    move        = { 1240, 695 },
    size        = { "(monitor_w*0.25)", "(monitor_h*0.25)" }
})

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.layer_rule({
  name = "noctalia",
  match = {
    namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
  },
  no_anim = true,
  ignore_alpha = 0.5,
  blur = true,
  blur_popups = true,
})
-- Binds workspaces to monitors (1 to 5 for primary monitor, 6 to 10 for secondary one)
for i = 1,5 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = monitors.primary.output,
        default = true
    })
end
