hl.config({
    general = {
        gaps_in = 10,
        gaps_out = 20,
        border_size = 2,
        col = {
            active_border = { colors = { "rgba(50fa7bff)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)"
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle"
    },
    decoration = {
        rounding = 10,
        rounding_power = 2,
        active_opacity = 1,
        inactive_opacity = 1,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)"
        },
        blur = {
            enabled = true,
            size = 10,
            passes = 3,
            noise = 0.006,
            vibrancy = 0.1
        }
    },
    animations = {
        enabled = true,
        bezier = {
            "linear, 0, 0, 1, 1",
            "almostLinear, 0.5, 0.5, 0.75, 1.0",
            "fastEnd, 0.4, 0.0, 1.0, 1.0"
        },
        animation = {
            "windows, 1, 2, almostLinear, popin 80%",
            "windowsIn, 1, 2, almostLinear, popin 80%",
            "windowsOut, 1, 2, almostLinear, popin 80%",
            "border, 1, 2, linear",
            "fade, 1, 2, almostLinear",
            "layers, 1, 2, almostLinear, fade",
            "layersIn, 1, 2, almostLinear, fade",
            "layersOut, 1, 2, almostLinear, fade",
            "workspaces, 1, 2.5, fastEnd, slide"
        }
    },
    cursor = {
        no_hardware_cursors = true
    }
})

hl.layer_rule({
    match = { namespace = "^(quickshell)$" },
    blur = true,
    ignore_alpha = 0.1
})
