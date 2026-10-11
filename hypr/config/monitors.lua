-- monitor and other graphical session configs
-- https://wiki.hypr.land/Configuring/Monitors/
local monitors = {
    primary = {
        output                  = "HDMI-A-1",
        mode                    = "1920x1080@120",
        position                = "0x0",
        scale                   = 1
    },
    secondary = {
        output                  = "HDMI-A-2",
        mode                    = "1920x1080@60",
        position                = "1920x0",
        scale                   = 1
    }
}

for _, m in pairs(monitors) do
    hl.monitor(m)
end

-- https://wiki.hypr.land/configuring/extra/xwayland/
hl.config({
    xwayland = {
        force_zero_scaling  = true
    }
})

return monitors
