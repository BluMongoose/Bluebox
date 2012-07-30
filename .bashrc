#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# variables
export BROWSER="firefox"
export EDITOR="nano"

# modified commands
alias diff='colordiff'              # requires colordiff package
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'
alias ..='cd ..'

# new commands
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep $1'      # requires an argument
alias openports='netstat --all --numeric --programs --inet --inet6'
alias pg='ps -Af | grep $1'         # requires an argument (note: /usr/bin/pg is installed by the util-linux package; maybe a different alias name should be used)

# privileged access
if [ $UID -ne 0 ]; then
    alias sudo='sudo '
    alias scat='sudo cat'
    alias svim='sudo vim'
    alias root='sudo su'
    alias reboot='sudo reboot'
    alias halt='sudo halt'
    alias update='sudo pacman -Syu'
    alias netcfg='sudo netcfg2'
    alias nano='sudo nano'
fi

# ls
alias ls='ls -hF --color=auto'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'

# safety features
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'                    # 'rm -i' prompts for every file
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# pacman aliases (if applicable, replace 'pacman' with 'yaourt'/'pacaur'/whatever)
alias pac="yaourt -S"        # default action     - install one or more packages
alias pacu="yaourt -Syua"     # '[u]pdate'         - upgrade all packages to their newest version
alias pacs="yaourt -Ss"      # '[s]earch'         - search for a package using one or more keywords
alias paci="yaourt -Si"      # '[i]nfo'           - show information about a package
alias pacr="yaourt -R"       # '[r]emove'         - uninstall one or more packages
alias pacl="yaourt -Sl"      # '[l]ist'           - list all packages of a repository
alias pacll="yaourt -Qqm"    # '[l]ist [l]ocal'   - list all packages which were locally installed (e.g. AUR packages)
alias paclo="yaourt -Qdt"    # '[l]ist [o]rphans' - list all packages which are orphaned
alias paco="yaourt -Qo"      # '[o]wner'          - determine which package owns a given file
alias pacf="yaourt -Ql"      # '[f]iles'          - list all files installed by a given package
alias pacc="yaourt -Sc"      # '[c]lean cache'    - delete all not currently installed package files
alias pacm="makepkg -fci"    # '[m]ake'           - make package from PKGBUILD file in current directory
alias pacusr="yaourt -Qqet"  # '[usr] installed'  - end user install list

# Video Commands
alias futurama="mplayer -shuffle -playlist ~/Playlists/futurama.m3u"
alias familyguy="mplayer -shuffle -playlist ~/Playlists/familyguy.m3u"
alias simpsons="mplayer -shuffle -playlist ~/Playlists/simpsons.m3u"
alias americandad="mplayer -shuffle -playlist ~/Playlists/americandad.m3u"

# Suspend
alias suspend="sudo pm-suspend"

# Check Mem Use
alias memfree="free -m -l"

# Autocomplete
complete -cf sudo
complete -cf man

# Check outside ip
alias checkip="echo `wget -q -O - http://automation.whatismyip.com/n09230945.asp`"

# Screen capture at 1920x1080
alias screencap="ffmpeg -f x11grab -s 1920x1080 -r 15 -i :0 -vcodec libx264 -vpre normal -threads 0 ~/screencap.mp4"

# Play mounted iso
alias playiso="mplayer dvd:// -dvd-device /mnt/disk/"

# Mount iso to /mnt/disk/
alias mountiso="_mountiso"
function _mountiso()
{
sudo mount -t iso9660 -o ro,loop=/dev/loop0 $1 /mnt/disk/
}

# Mount a 1GB ramdisk in /mnt/tmp/
alias ramdisk="sudo mount -t ramfs -o nodev,nosuid,noexec,nodiratime,size=1024M none /mnt/tmp/"

# Bring up the net
alias netup="sudo rc.d start network"
alias netdown="sudo rc.d stop network"
alias netrestart="sudo rc.d restart network"

# Test for dynamic text width
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

PS1='[\u@\h \W]\$ '
#PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[0;32m\] '
