hl.on("hyprland.start", function ()
    -- Autostart necessary processes
    hl.exec_cmd("solaar")
    hl.exec_cmd("qs -c widget")
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
    hl.exec_cmd("/usr/lib/pam_kwallet_init")
    hl.exec_cmd("awww-daemon")
    
    -- Set a wallpaper per monitor. Adjust image paths as needed.
    hl.exec_cmd("sleep 1 && awww img /home/luis/Imagens/wallpaper/leaves.jpg --outputs DP-1")
    hl.exec_cmd("sleep 1 && awww img /home/luis/Imagens/wallpaper/Island05.png --outputs HDMI-A-1")
    hl.exec_cmd("sleep 1 && awww img /home/luis/Imagens/wallpaper/Japanese-Red-Autumn.jpg --outputs HDMI-A-2")
    
    hl.exec_cmd("hypridle")
    -- hyprsunset é gerenciado via systemd user service (systemctl --user enable hyprsunset.service)
    -- Não iniciar manualmente aqui para evitar instâncias duplicadas

    
    -- cliphist
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    
    -- fix dolphin
    hl.exec_cmd("kbuildsycoca6")
    
    -- Autostart programs on specific workspaces (using pure Lua timer)
    hl.timer(function()
        hl.exec_cmd("spotify-launcher", { workspace = "1 silent" })
        hl.exec_cmd("bitwarden-desktop %U", { workspace = "1 silent" })
        hl.exec_cmd("discord", { workspace = "2 silent" })
        hl.exec_cmd("vicinae server")
        hl.exec_cmd("/home/luis/.config/hypr/scripts/sunset-startup-check.sh")
    end, { timeout = 3000, type = "oneshot" })
    
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user start sunshine.service")
end)
