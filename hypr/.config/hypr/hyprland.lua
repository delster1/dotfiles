-- ~/.config/hypr/hyprland.lua

-- =====================================================================
-- VARIABLES
-- =====================================================================
local terminal = "kitty"
local fileManager = "nautilus"
local menu = "rofi -show drun"
local mainMod = "SUPER"

-- If you update pywal to output a Lua template, you can load it like this:
-- local colors = require(os.getenv("HOME") .. "/.cache/wal/colors-hyprland")

-- =====================================================================
-- CORE CONFIGURATION
-- =====================================================================
hl.config({
    -- Replaces hyprland_monitors.conf and your standard monitor rules
    monitor = {
        "eDP-1,preferred,auto,1.6",
        "DP-9,preferred,auto,1, transform, 1",
        "auto,preferred,auto,1.6",
        "DP-7, preferred, auto, 1.0, mirror, eDP-1"
    },

    cursor = {
        no_hardware_cursors = true
    },

    exec = {
        -- For GTK3 and GTK4 apps
        "gsettings set org.gnome.desktop.interface gtk-theme 'YOUR_DARK_GTK3_THEME'",
        "gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'"
    },

    exec_once = {
        terminal,
        "waybar & hyprpaper & hypridle & swaync",
        "swaybg -i /home/d3/Pictures/wallpaper.jpg"
    },

    env = {
        "QT_QPA_PLATFORMTHEME,qt6ct",
        "XCURSOR_SIZE,24",
        "HYPRCURSOR_SIZE,24"
    },

    general = {
        gaps_in = 5,
        gaps_out = 20,
        border_size = 2,
        
        -- Make sure to define these colors as Lua variables or strings
        -- col_active_border = colors.color6 .. " " .. colors.color6 .. " 45deg",
        col_active_border = "rgba(33ccffee) rgba(00ff99ee) 45deg", 
        col_inactive_border = "rgba(595959aa)",

        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle"
    },

    decoration = {
        rounding = 10,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)"
        },
        
        blur = {
            enabled = true,
            size = 5,
            passes = 1,
            vibrancy = 0.1696
        }
    },

    animations = {
        enabled = true,
        bezier = {
            "easeOutQuint,0.23,1,0.32,1",
            "easeInOutCubic,0.65,0.05,0.36,1",
            "linear,0,0,1,1",
            "almostLinear,0.5,0.5,0.75,1.0",
            "quick,0.15,0,0.1,1"
        },
        animation = {
            "global, 1, 10, default",
            "border, 1, 5.39, easeOutQuint",
            "windows, 1, 4.79, easeOutQuint, slide",
            "windowsIn, 1, 4.1, easeOutQuint, popin 87%",
            "windowsOut, 1, 1.49, linear, popin 87%",
            "fadeIn, 1, 1.73, almostLinear",
            "fadeOut, 1, 1.46, almostLinear",
            "fade, 1, 3.03, quick",
            "layers, 1, 3.81, easeOutQuint, slide",
            "layersIn, 1, 4, easeOutQuint, slide",
            "layersOut, 1, 1.5, linear, slide",
            "fadeLayersIn, 1, 1.79, almostLinear",
            "fadeLayersOut, 1, 1.39, almostLinear",
            "workspaces, 1, 1.94, almostLinear, slide",
            "workspacesIn, 1, 1.21, almostLinear, slide",
            "workspacesOut, 1, 1.94, almostLinear, slide"
        }
    },

    dwindle = {
        pseudotile = true,
        preserve_split = true,
        smart_split = false
    },

    master = {
        new_status = "master"
    },

    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false
    },

    input = {
        kb_layout = "us",
        follow_mouse = 1,
        sensitivity = 0.3,
        scroll_method = "2fg",
        accel_profile = "flat",
        touchpad = {
            disable_while_typing = true,
            clickfinger_behavior = true,
            natural_scroll = false,
            scroll_factor = 0.3,
            tap_and_drag = false,
            drag_lock = false
        }
    },

    device = {
        { name = "elan9008", enabled = false },
        { name = "2e36-touchscree#n", enabled = false },
        { name = "elan9008:00-04f3:2e36-touchscreen", enabled = false },
        { name = "epic-mouse-v1", sensitivity = -0.5 }
    },

    windowrulev2 = {
        "opacity 0.8 0.8,class:^(floorp)$",
        "opacity 0.8 0.8,class:^(code-oss)$",
        "opacity 0.8 0.8,class:^(firefox)$",
        "opacity 0.8 0.8,class:^(discord)$",
        "opacity 0.7 0.7,class:^(obsidian)$",
        "opacity 0.8 0.8,class:^(steam)$",
        "suppressevent maximize, class:.*",
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
    }
})

-- =====================================================================
-- KEYBINDINGS
-- =====================================================================

-- General Binds
hl.bind("SUPER, Tab", hl.dsp.workspace("previous"))
hl.bind(mainMod .. ", o", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. ", Q", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind(mainMod .. ", return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. ", C", hl.dsp.window.close())
hl.bind(mainMod .. ", M", hl.dsp.exit())
hl.bind(mainMod .. ", E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. ", V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. ", P", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. ", R", hl.dsp.layout.dwindle.pseudo())
hl.bind("SUPER SHIFT, S", hl.dsp.exec_cmd("hyprshot -m region"))

-- Move window 
hl.bind("SUPER SHIFT, H", hl.dsp.window.move("l"))
hl.bind("SUPER SHIFT, L", hl.dsp.window.move("r"))
hl.bind("SUPER SHIFT, K", hl.dsp.window.move("u"))
hl.bind("SUPER SHIFT, J", hl.dsp.window.move("d"))

-- Move focus
hl.bind(mainMod .. ", h", hl.dsp.window.move_focus("l"))
hl.bind(mainMod .. ", l", hl.dsp.window.move_focus("r"))
hl.bind(mainMod .. ", k", hl.dsp.window.move_focus("u"))
hl.bind(mainMod .. ", j", hl.dsp.window.move_focus("d"))

-- Workspace Loops (Replaces all 20 of your workspace switching lines!)
for i = 1, 9 do
    hl.bind(mainMod .. ", " .. i, hl.dsp.workspace(tostring(i)))
    hl.bind(mainMod .. " SHIFT, " .. i, hl.dsp.window.move_to_workspace(tostring(i)))
end
-- Handle Workspace 10 separately
hl.bind(mainMod .. ", 0", hl.dsp.workspace("10"))
hl.bind(mainMod .. " SHIFT, 0", hl.dsp.window.move_to_workspace("10"))

-- Mouse scrolling
hl.bind(mainMod .. ", mouse_down", hl.dsp.workspace("e+1"))
hl.bind(mainMod .. ", mouse_up", hl.dsp.workspace("e-1"))

-- Mouse bindings (move and resize) using the mouse options table
hl.bind(mainMod .. ", mouse:272", hl.dsp.window.move({ mouse = true }))
hl.bind(mainMod .. ", mouse:273", hl.dsp.window.resize({ mouse = true }))

-- Multimedia Keys (e = repeat_bind, l = locked/works while lockscreen is active)
local media_opts = { repeat_bind = true, locked = true }
hl.bind("", "XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), media_opts)
hl.bind("", "XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), media_opts)
hl.bind("", "XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), media_opts)
hl.bind("", "XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), media_opts)
hl.bind("", "XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), media_opts)
hl.bind("", "XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), media_opts)

local player_opts = { locked = true }
hl.bind("", "XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), player_opts)
hl.bind("", "XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), player_opts)
hl.bind("", "XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), player_opts)
hl.bind("", "XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), player_opts)
