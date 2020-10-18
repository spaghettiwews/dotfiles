# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set background using Bing daily wallpaper
url=$(curl -s "https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-US" | jq -r '"https://www.bing.com" + .images[0].url')
img=$(echo ${url%%&*}) && img=$(echo ${img#*=})
cd ~ && homepath=$(pwd)
mkdir -p $homepath/Pictures/wallpapers && wget -q $url -O ~/Pictures/wallpapers/$img && gsettings set org.gnome.desktop.background picture-uri "file://${homepath}/Pictures/wallpapers/${img}" &&
echo "${homepath}/Pictures/wallpapers/${img} has been set as your desktop background"
export PATH="$PATH:/opt/mssql-tools/bin"
