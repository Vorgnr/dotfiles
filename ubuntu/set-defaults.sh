#!/bin/bash
#
# Ubuntu
#
# This set my preferred default options of the OS

set_system_conf() {
	dconf write "$1" "'$2'"
}

# Solarize
solarize_terminal() {
	# Solarized theme: http://ethanschoonover.com/solarized
	# 
	# Adapted from these sources:
	# https://gist.github.com/codeforkjeff/1397104#file-solarize-sh
	# https://gist.github.com/1280177
	# http://xorcode.com/guides/solarized-vim-eclipse-ubuntu/
	case "$1" in 
		"dark")
			local PALETTE="#070736364242:#D3D301010202:#858599990000:#B5B589890000:#26268B8BD2D2:#D3D336368282:#2A2AA1A19898:#EEEEE8E8D5D5:#00002B2B3636:#CBCB4B4B1616:#58586E6E7575:#65657B7B8383:#838394949696:#6C6C7171C4C4:#9393A1A1A1A1:#FDFDF6F6E3E3"
			local BG_COLOR="#00002B2B3636"
			local FG_COLOR="#65657B7B8383"
			;;
		"light")
			local PALETTE="#EEEEE8E8D5D5:#D3D301010202:#858599990000:#B5B589890000:#26268B8BD2D2:#D3D336368282:#2A2AA1A19898:#070736364242:#FDFDF6F6E3E3:#CBCB4B4B1616:#9393A1A1A1A1:#838394949696:#65657B7B8383:#6C6C7171C4C4:#58586E6E7575:#00002B2B3636"
			local BG_COLOR="#FDFDF6F6E3E3"
			local FG_COLOR="#838394949696"
			;;
		*)
		echo "Usage: solarize [light | dark]"
		exit
		;;
	esac
	 
	# Gnome Terminal
	# gconftool-2 --set "/apps/gnome-terminal/profiles/Default/use_theme_background" --type bool false
	# gconftool-2 --set "/apps/gnome-terminal/profiles/Default/use_theme_colors" --type bool false
	# gconftool-2 --set "/apps/gnome-terminal/profiles/Default/palette" --type string "$PALETTE"
	# gconftool-2 --set "/apps/gnome-terminal/profiles/Default/background_color" --type string "$BG_COLOR"
	# gconftool-2 --set "/apps/gnome-terminal/profiles/Default/foreground_color" --type string "$FG_COLOR"
	
	# Pantheon Terminal
	set_system_conf "/org/pantheon/terminal/settings/palette" "$PALETTE"
	set_system_conf "/org/pantheon/terminal/settings/background" "$BG_COLOR"
	set_system_conf "/org/pantheon/terminal/settings/foreground" "$FG_COLOR"
}

solarize_terminal dark
set_system_conf "/org/pantheon/terminal/settings/font" "Source Code Pro for Powerline 10"