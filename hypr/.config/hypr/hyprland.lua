-- Converted from hyprland.conf (hyprlang deprecated as of Hyprland 0.55)
-- See https://wiki.hypr.land/Configuring/Start/

hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

-- Autostart
hl.on("hyprland.start", function()
    hl.exec_cmd("~/.config/hypr/xdg-portal-hyprland")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("hyprpolkitagent")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("wlsunset -l 43.6 -L -79.4")
    hl.exec_cmd("dropbox")
end)

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        natural_scroll = true,

        touchpad = {
            natural_scroll = true,
        },
    },
})

-- See https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 15,

        border_size = 2,

        col = {
            active_border   = "rgb(cdd6f4)",
            inactive_border = "rgba(595959aa)",
        },

        layout = "dwindle",
    },

    binds = {
        workspace_back_and_forth = true,
        allow_workspace_cycles   = true,
        focus_preferred_method   = 1, -- pick focus target by shared edge length, not history
    },

    misc = {
        disable_hyprland_logo = true,
    },

    decoration = {
        rounding = 10,

        blur = {
            enabled = true,
            size    = 7,
            passes  = 3,
        },

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true, -- you probably want this
    },

    master = {
        new_status = "master",
    },
})

hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows",    enabled = true, speed = 7,  bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7,  bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border",     enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "fade",       enabled = true, speed = 7,  bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6,  bezier = "default" })

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
hl.window_rule({
    name  = "windowrule-1",
    match = { class = "^(kitty)$" },
    opacity = "0.8 0.8",
})

hl.window_rule({
    name  = "windowrule-2",
    match = { class = "^(thunar)$" },
    opacity = "0.8 0.8",
})

local mainMod = "SUPER"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("kitty")) -- open the terminal
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close()) -- close the active window
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("wlogout --protocol layer-shell")) -- show the logout window
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exit()) -- exit Hyprland entirely (force quit)
hl.bind(mainMod .. " + F2", hl.dsp.exec_cmd("firefox-developer-edition")) -- show the browser
hl.bind(mainMod .. " + F3", hl.dsp.exec_cmd("thunar")) -- show the graphical file browser
hl.bind(mainMod .. " + F4", hl.dsp.exec_cmd("keepassxc")) -- show the password manager
hl.bind(mainMod .. " + F5", hl.dsp.exec_cmd("hyprlock")) -- lock the screen
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" })) -- allow a window to float
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("wofi")) -- show the graphical app launcher
hl.bind(mainMod .. " + SPACE", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" })) -- fullscreen and also hide bars

-- Screenshot a window
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
-- Screenshot a monitor
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output"))
-- Screenshot a region
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))

-- Move focus with mainMod + h/j/k/l
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))

-- Move focus to adjacent workspace
hl.bind(mainMod .. " + right", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + left",  hl.dsp.focus({ workspace = "-1" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Move window with mainMod + HJKL
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "down" }))

-- Volume and media control
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer -i 5"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer -d 5"))
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("pamixer --default-source -m"))
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("pamixer -t"))
hl.bind("XF86AudioPlay",        hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPause",       hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext",        hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev",        hl.dsp.exec_cmd("playerctl previous"))
