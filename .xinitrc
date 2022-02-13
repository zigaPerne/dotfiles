#!/bin/sh

setxkbmap -layout si

export GTK_IM_MODULE='uim'
export QT_IM_MODULE='uim'
uim-xim &
export XMODIFIERS='@im=uim'
export MUSIC_DIR=$HOME/Music

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
export QT_QPA_PLATFORMTHEME=qt5ct
export PATH=$HOME/.local/share/scripts:$PATH #SET PATH (VERY IMPORTANT)
export PATH=$HOME/Programs/suckless/dwmblocks/bar-scripts:$PATH #SET PATH (VERY IMPORTANT)
export PATH=$HOME/Programs/suckless/dmenu/scripts:$PATH #SET PATH (VERY IMPORTANT)



# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


picom &				# Enables transparency
setscreen &			# Sets wallpaper and framerate
weather-refresh.sh &		# Updates wather info every 30 min
net_speed &			# Returns average net speed every 3 seconds in bps
dwmblocks &			# Executes script for displaying taskbar
sxhkd > /dev/null 2>&1 &	# Bind keys
keys &				# Set x rate
xiccd &				# Set ICC profile
exec pulseaudio &
mpd &
#exec start-pulseaudio-x11
exec dwm
