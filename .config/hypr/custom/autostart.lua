hl.on("hyprland.start", function()
	hl.exec_cmd("kdeconnectd")
	hl.exec_cmd("kdeconnect-indicator")
	hl.exec_cmd("syncthing --no-browser")
	hl.exec_cmd(
		'mpvpaper -o "input-ipc-server=/tmp/mpvpaper.sock loop loop-playlist shuffle no-audio" eDP-1 ~/Pictures/wallpapers/playlist.m3u'
	)
	hl.exec_cmd("~/.config/hypr/script/mpvpaper-autopause.sh")
	hl.exec_cmd("waybar")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user start xdg-desktop-portal-hyprland")
	hl.exec_cmd("systemctl --user start hyprland-session.target")
end)
