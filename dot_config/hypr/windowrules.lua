hl.window_rule({ name = "Ghost Window", no_focus = true })
hl.window_rule({ name = "Vivaldi Browser", match = { class = "^(vivaldi-stable)$" }, opacity = "0.97 0.93" })
hl.window_rule({ name = "Visual Studio Code", match = { class = "^(code)$" }, opacity = "0.95 0.9" })
hl.window_rule({ name = "Kitty Terminal", match = { class = "^(kitty)$" }, opacity = "0.9 0.85", tile = true })
hl.window_rule({ name = "QuickShell", match = { class = "^(quickshell)$" }, opacity = "0.9 0.85" })
hl.window_rule({ name = "hyprShot", match = { class = "^(bash)$" }, no_focus = true, no_blur = true })
hl.window_rule({ name = "Steam", match = { class = "^(steam)$" }, monitor = "DP-1" })
hl.window_rule({ name = "Fullscreen Anim", match = { fullscreen = true }, animation = "slide top" })
hl.window_rule({ name = "Steam Games", match = { class = "^(steam_app_.*)$" }, animation = "fade", workspace = "4" })
hl.window_rule({ name = "Quickshell Share Picker", match = { title = "^(Compartilhar Tela)$" }, float = true, center = true, size = { 800, 650 } })

hl.config({
    master = {
        new_status = "master"
    },
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false
    }
})
