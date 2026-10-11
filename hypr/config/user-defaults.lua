-- USER DEFAULTS --
-- Note: for noctalia, see https://docs.noctalia.dev/noctalia/compositor-settings/hyprland/
local ipc           = "noctalia msg"

-- default programs
return {
    terminal        = "kitty",                                              -- Terminal
    fileManager     = "thunar",                                             -- File manager
    music           = "spotify",                                            -- Music player / Streaming music service
    musicClass      = "Spotify",                                            -- Class por spotify
    messageClient   = "ferdium",                                            -- Message client (like Ferdium, Rambox...)
    discordClient   = "vesktop",                                            -- Discord client
    browser         = "zen-browser",                                        -- Browser
    screenshot      = "flameshot gui",                                      -- Screenshot utility

    -- shell defaults
    barOrShell      = "noctalia",                                           -- Status bar/shell
    menu            = " panel-toggle launcher",                             -- App launcher
    sessionMenu     = " panel-toggle session",                              -- Session menu (lock, suspend, shutdown...)
    sessionLock     = " session lock",                                      -- Session lock
    settings        = " settings-open",                                     -- Shell Settings
    windowSwitcher  = " window-switcher ",                                  -- Window switcher
    ipc             = ipc,

    -- brightness and volume control
    volumeUp       = ipc .. "volume-up",
    volumeDown     = ipc .. "volume-down",
    mute           = ipc .. "volume-mute",
    brightnessUp   = ipc .. "brightnessUp",
    brightnessDown = ipc .. "brightnessDown"
}
