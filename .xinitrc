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
awsetbg -c -r ~/Pictures/ &
mpd &
compton -cCGbf -o 0.75 -t 0.02 -l 0.02 -r 2.5
urxvtd -q -f -o 
urxvtc -e htop -d 10 &
numlockx &
#firefox &
urxvtc -e finch &

# Xinit WM

if [[ $1 == "awesome" ]]
then
  exec awesome
elif [[ $1 == "kde" ]]
then
  exec ck-launch-session dbus-launch startkde
else
  echo "Choose a window manager"
fi

