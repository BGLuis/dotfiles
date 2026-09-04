require("programs")

local mainMod = "SUPER"

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + CTRL + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

-- Move focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = tostring(i) }))
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = tostring(i) }))
end
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = "10" }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = "10" }))

-- Special workspace
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Mouse binds
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Multimedia
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true, locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("hyprctl hyprsunset gamma +10"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("hyprctl hyprsunset gamma -10"), { repeating = true, locked = true })

-- Playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Screenshots (Quickshell)
hl.bind("Print", hl.dsp.global("quickshell:CaptureScreen"))
hl.bind("SHIFT + Print", hl.dsp.global("quickshell:CaptureRegion"))
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.global("quickshell:CaptureOCR"))

-- Lock (Quickshell)
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("quickshell -c widget ipc call shell lock"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("quickshell -c widget ipc call shell lock"))

-- Cliphist
hl.bind(mainMod .. " + CTRL + V", hl.dsp.exec_cmd("cliphist list | vicinae dmenu | cliphist decode | wl-copy"))

-- Color picker
hl.bind(mainMod .. " + O", hl.dsp.global("quickshell:ColorPicker"))

-- Quickshell global shortcuts
hl.bind("SUPER + T", hl.dsp.global("quickshell:OpenMenu"))
hl.bind("SUPER + SHIFT + P", hl.dsp.global("quickshell:CaptureMenu"))
hl.bind("SUPER + ESCAPE", hl.dsp.global("quickshell:SessionMenu"))
hl.bind("SUPER + SHIFT + C", hl.dsp.global("quickshell:ClearNotifs"))
hl.bind("SUPER + SHIFT + T", hl.dsp.global("quickshell:CycleScreen"))

-- Quickshell: media player controls
hl.bind("SUPER + SHIFT + space", hl.dsp.global("quickshell:PlayPause"))
hl.bind("SUPER + SHIFT + right", hl.dsp.global("quickshell:NextTrack"))
hl.bind("SUPER + SHIFT + left", hl.dsp.global("quickshell:PrevTrack"))
hl.bind("SUPER + SHIFT + N", hl.dsp.global("quickshell:CyclePlayer"))
hl.bind("SUPER + N", hl.dsp.global("quickshell:ShowPlayer"))

-- Blue light filter
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("/home/luis/.config/hypr/scripts/bluelight-toggle.sh"))
hl.bind(mainMod .. " + SHIFT + equal", hl.dsp.exec_cmd("hyprctl hyprsunset temperature +500"), { repeating = true })
hl.bind(mainMod .. " + SHIFT + minus", hl.dsp.exec_cmd("hyprctl hyprsunset temperature -500"), { repeating = true })

