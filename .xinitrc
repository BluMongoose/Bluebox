#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Autostart some apps

xrdb -merge ~/.Xresources
xset +fp /usr/share/fonts/local
xset fp rehash
mpd &
urxvtd -q -f -o 
dunst &
exec i3 
