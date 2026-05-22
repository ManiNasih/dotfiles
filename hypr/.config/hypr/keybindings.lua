---------------------
---- KEYBINDINGS ----
---------------------

hl.config({
	plugin = {
		split_monitor_workspaces = {
			count = 5,
		},
	},
})

local terminal = "alacritty"
local fileManager = "nautilus"
local menu = "rofi -show drun"

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("xdg-open https://"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + U", hl.dsp.layout("togglesplit")) -- dwindle only

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

local smw = hl.plugin.split_monitor_workspaces

for i = 1, 8 do
	local key = tostring(i)
	hl.bind(mainMod .. " + " .. key, function()
		return smw.workspace(i)
	end)
	hl.bind(mainMod .. " + SHIFT + " .. key, function()
		return smw.move_to_workspace_silent(i)
	end)
end

hl.bind(mainMod .. " + TAB", function() smw.change_monitor("next") end)
hl.bind(mainMod .. " + SHIFT + TAB", function() smw.grab_rogue_windows() end)

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Screenshots
local ScreenshotPath = "/home/mani/Pictures/Screenshots"

hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output -m active -o " .. ScreenshotPath))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m output -m active --clipboard-only -o " .. ScreenshotPath))

hl.bind(mainMod .. " + F12", hl.dsp.exec_cmd("hyprshot -m region -o " .. ScreenshotPath))
hl.bind(mainMod .. " + SHIFT + F12", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only -o " .. ScreenshotPath))

hl.bind(mainMod .. " + F11", hl.dsp.exec_cmd("hyprshot -m output -m active --raw | satty --filename -"))
hl.bind(mainMod .. " + SHIFT + F11", hl.dsp.exec_cmd("hyprshot -m region --raw | satty --filename -"))
