-- ~/.config/hypr/hyprland.lua

-- =====================================================================
-- VARIABLES
-- =====================================================================
local terminal = "kitty"
local fileManager = "nautilus"
local menu = "rofi -show drun"
local mainMod = "SUPER"

-- =====================================================================
-- CORE CONFIGURATION
-- =====================================================================
hl.config({
    monitor = {
        "eDP-1,preferred,auto,1.6",
        "DP-9,preferred,auto,1, transform, 1",
        "auto,preferred,auto,1.6",
        "DP-7, preferred, auto, 1.0, mirror, eDP-1"
    },

    cursor = {
        no_hardware_cursors = true
    },

    exec_once = {
        "waybar",
        "hyprpaper",
        "hypridle",
        "swaync",
        -- Fallback wallpaper if hyprpaper isn't configured
        "swaybg -i ~/Pictures/wallpaper.jpg -m fill"
    },

    env = {
        "QT_QPA_PLATFORMTHEME,qt6ct",
        "XCURSOR_SIZE,24",
        "HYPRCURSOR_SIZE,24"
    },

    general = {
        gaps_in = 5,
        gaps_out = 15,
        border_size = 2,
        
        -- Clean Blue/Green gradient for active, Dark Grey for inactive
        col_active_border = "rgba(33ccffee) rgba(00ff99ee) 45deg", 
        col_inactive_border = "rgba(595959aa)",

        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle"
    },

    decoration = {
        rounding = 10,
        active_opacity = 1.0,
        inactive_opacity = 0.9, -- Slight dim for inactive windows
        
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)"
        },
        
        blur = {
            enabled = true,
            size = 3,
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
            "workspaces, 1, 1.94, almostLinear, slide"
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
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        font_family = "Sans"
    },

    input = {
        kb_layout = "us",
        follow_mouse = 1,
        sensitivity = 0, -- Default sensitivity
        touchpad = {
            disable_while_typing = true,
            natural_scroll = false,
            tap_to_click = true
        }
    },

    -- Disabling problematic touch devices specifically
    device = {
        { name = "elan9008", enabled = false },
        { name = "2e36-touchscree#n", enabled = false },
        { name = "elan9008:00-04f3:2e36-touchscreen", enabled = false }
    },
})

-- =====================================================================
-- KEYBINDINGS
-- =====================================================================

-- App Launching & System
hl.bind(mainMod, "Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod, "E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod, "P", hl.dsp.exec_cmd(menu))
hl.bind(mainMod, "C", hl.dsp.window.close())
hl.bind(mainMod, "M", hl.dsp.exit())
hl.bind(mainMod, "V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod, "O", hl.dsp.exec_cmd("hyprlock"))

-- Screenshots
hl.bind(mainMod, "Q", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("SUPER_SHIFT", "S", hl.dsp.exec_cmd("hyprshot -m region"))

-- Focus Movement (Vim keys)
hl.bind(mainMod, "H", hl.dsp.window.move_focus("l"))
hl.bind(mainMod, "L", hl.dsp.window.move_focus("r"))
hl.bind(mainMod, "K", hl.dsp.window.move_focus("u"))
hl.bind(mainMod, "J", hl.dsp.window.move_focus("d"))

-- Window Movement (Vim keys)
hl.bind("SUPER_SHIFT", "H", hl.dsp.window.move("l"))
hl.bind("SUPER_SHIFT", "L", hl.dsp.window.move("r"))
hl.bind("SUPER_SHIFT", "K", hl.dsp.window.move("u"))
hl.bind("SUPER_SHIFT", "J", hl.dsp.window.move("d"))

-- Workspaces
for i = 1, 9 do
    hl.bind(mainMod, tostring(i), hl.dsp.workspace(tostring(i)))
    hl.bind("SUPER_SHIFT", tostring(i), hl.dsp.window.move_to_workspace(tostring(i)))
end
hl.bind(mainMod, "0", hl.dsp.workspace("10"))
hl.bind("SUPER_SHIFT", "0", hl.dsp.window.move_to_workspace("10"))

-- Mouse Binds
hl.bind(mainMod, "mouse:272", hl.dsp.window.move({ mouse = true }))
hl.bind(mainMod, "mouse:273", hl.dsp.window.resize({ mouse = true }))

-- Media Keys
local media_opts = { repeat_bind = true, locked = true }
hl.bind("", "XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), media_opts)
hl.bind("", "XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), media_opts)
hl.bind("", "XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), media_opts)
hl.bind("", "XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), media_opts)
hl.bind("", "XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), media_opts)
