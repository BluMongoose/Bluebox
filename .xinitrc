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
awsetbg -c -r ~/Pictures/ &
mpd &
compton -cCGbf -o 0.75 -t 0.02 -l 0.02 -r 2.5
urxvtd -q -f -o 
urxvtc -e htop -d 10 &
urxvtc -e finch &
numlockx &
exec awesome

